package com.sdc.seouldreamcellbe.exception;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;

@Getter
@RequiredArgsConstructor
public enum ErrorCode {

    // Common
    INVALID_INPUT_VALUE(HttpStatus.BAD_REQUEST, "C001", " Invalid Input Value"),
    METHOD_NOT_ALLOWED(HttpStatus.METHOD_NOT_ALLOWED, "C002", " Method Not Allowed"),
    ENTITY_NOT_FOUND(HttpStatus.BAD_REQUEST, "C003", " Entity Not Found"),
    INTERNAL_SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "C004", "Server Error"),
    INVALID_TYPE_VALUE(HttpStatus.BAD_REQUEST, "C005", " Invalid Type Value"),
    HANDLE_ACCESS_DENIED(HttpStatus.FORBIDDEN, "C006", "Access is Denied"),

    // User
    USER_NOT_FOUND(HttpStatus.NOT_FOUND, "U001", "User not found"),
    EMAIL_DUPLICATION(HttpStatus.BAD_REQUEST, "U002", "Email is Duplication"),
    LOGIN_INPUT_INVALID(HttpStatus.BAD_REQUEST, "U003", "Login input is invalid"),

    // JWT
    TOKEN_INVALID(HttpStatus.UNAUTHORIZED, "J001", "Token is invalid"),
    TOKEN_EXPIRED(HttpStatus.UNAUTHORIZED, "J002", "Token is expired"),

    // Semester
    NO_ACTIVE_SEMESTER(HttpStatus.NOT_FOUND, "S001", "현재 활성화된 학기가 없습니다."),
    MULTIPLE_ACTIVE_SEMESTERS(HttpStatus.CONFLICT, "S002", "활성화된 학기가 2개 이상입니다. 관리자에게 문의하세요."),
    INACTIVE_SEMESTER_ACCESS(HttpStatus.FORBIDDEN, "ACCESS_001", "행정이 마감되어 조회할 수 없는 기간입니다.");


    private final HttpStatus status;
    private final String code;
    private final String message;

}
