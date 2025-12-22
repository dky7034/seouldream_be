package com.sdc.seouldreamcellbe.security;

import com.sdc.seouldreamcellbe.domain.User;
import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtTokenProvider {

    private static final Logger logger = LoggerFactory.getLogger(JwtTokenProvider.class);

    private final SecretKey key;
    private final long accessTokenExpirationMs;
    private final long refreshTokenExpirationMs;

    public JwtTokenProvider(@Value("${app.jwt.secret}") String secret,
                            @Value("${app.jwt.expiration-ms}") long accessTokenExpirationMs,
                            @Value("${app.jwt.refresh-expiration-ms}") long refreshTokenExpirationMs) {
        this.key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(secret));
        this.accessTokenExpirationMs = accessTokenExpirationMs;
        this.refreshTokenExpirationMs = refreshTokenExpirationMs;
    }

    public String generateAccessToken(Authentication authentication) {
        User userPrincipal = (User) authentication.getPrincipal();
        return generateToken(userPrincipal, accessTokenExpirationMs);
    }

    public String generateRefreshToken(Authentication authentication) {
        User userPrincipal = (User) authentication.getPrincipal();
        return generateToken(userPrincipal, refreshTokenExpirationMs);
    }
    
    private String generateToken(User userPrincipal, long expirationMs) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + expirationMs);

        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", userPrincipal.getId());
        claims.put("role", userPrincipal.getRole().name());
        claims.put("username", userPrincipal.getUsername());

        // Conditionally add cellId for CELL_LEADERs
        if (userPrincipal.getRole() == com.sdc.seouldreamcellbe.domain.common.Role.CELL_LEADER) {
            if (userPrincipal.getMember() != null) {
                if (userPrincipal.getMember().getCell() != null) {
                    claims.put("cellId", userPrincipal.getMember().getCell().getId());
                    logger.info("cellId added to JWT for CELL_LEADER: {}", userPrincipal.getMember().getCell().getId());
                } else {
                    logger.warn("CELL_LEADER {} has member but no associated cell. cellId not added to JWT.", userPrincipal.getUsername());
                }
            } else {
                logger.warn("CELL_LEADER {} has no associated member. cellId not added to JWT.", userPrincipal.getUsername());
            }
        }

        return Jwts.builder()
            .claims(claims)
            .subject(userPrincipal.getUsername())
            .issuedAt(now)
            .expiration(expiryDate)
            .signWith(key)
            .compact();
    }

    public String getUsernameFromToken(String token) {
        return Jwts.parser()
            .verifyWith(key)
            .build()
            .parseSignedClaims(token)
            .getPayload()
            .getSubject();
    }

    public boolean validateToken(String token) {
        try {
            Jwts.parser().verifyWith(key).build().parseSignedClaims(token);
            return true;
        } catch (MalformedJwtException ex) {
            logger.error("Invalid JWT token");
        } catch (ExpiredJwtException ex) {
            logger.error("Expired JWT token");
        } catch (UnsupportedJwtException ex) {
            logger.error("Unsupported JWT token");
        } catch (IllegalArgumentException ex) {
            logger.error("JWT claims string is empty.");
        }
        return false;
    }
}
