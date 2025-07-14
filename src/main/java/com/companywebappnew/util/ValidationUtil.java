package com.companywebappnew.util;

import java.util.regex.Pattern;

public class ValidationUtil {
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");
    private static final Pattern MOBILE_PATTERN = Pattern.compile("^[0-9]{10}$");

    public static boolean isValidEmail(String email) {
        return email != null && EMAIL_PATTERN.matcher(email.trim().toLowerCase()).matches();
    }

    public static boolean isValidMobile(String mobile) {
        return mobile != null && MOBILE_PATTERN.matcher(mobile.trim()).matches();
    }

    public static boolean isValidName(String name) {
        return name != null && name.trim().length() >= 2 && name.trim().length() <= 50;
    }

    public static boolean isValidCity(String city) {
        return city != null && city.trim().length() >= 2 && city.trim().length() <= 30;
    }

    public static boolean isValidEmailLength(String email) {
        return email != null && email.trim().length() <= 100;
    }

    /**
     * Validates a username: 3-30 chars, alphanumeric or underscore.
     */
    public static boolean isValidUsername(String username) {
        return username != null && username.matches("^[A-Za-z0-9_]{3,30}$");
    }

    /**
     * Validates a password: 6-50 chars, any character.
     */
    public static boolean isValidPassword(String password) {
        return password != null && password.length() >= 6 && password.length() <= 50;
    }
} 