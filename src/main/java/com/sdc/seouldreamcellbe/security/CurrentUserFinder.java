package com.sdc.seouldreamcellbe.security;

import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CurrentUserFinder {

    private final UserRepository userRepository;

    /**
     * Gets the full User entity for the currently authenticated user.
     *
     * @return The {@link User} entity.
     * @throws NotFoundException if the user is not found in the repository or not authenticated.
     */
    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            throw new NotFoundException("인증된 사용자를 찾을 수 없습니다.");
        }

        Object principal = authentication.getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }

        return userRepository.findWithMemberAndCellByUsername(username)
                .orElseThrow(() -> new NotFoundException("인증된 사용자를 찾을 수 없습니다. Username: " + username));
    }
}
