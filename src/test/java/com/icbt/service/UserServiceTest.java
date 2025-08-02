package com.icbt.service;

import com.icbt.dto.LoginRequestDTO;
import com.icbt.dto.UserDTO;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UserServiceTest {

    private UserService userService;

    @BeforeEach
    public void setUp() {
        userService = new UserService();
    }

    @Test
    public void testLoginWithValidCredentials() {
        // Arrange
        LoginRequestDTO request = new LoginRequestDTO("abcd", "abcd1");

        // Act
        UserDTO result = userService.login(request);

        // Assert
        Assertions.assertNotNull(result, "User should not be null for valid credentials");
        Assertions.assertEquals("abcd", result.getUsername(), "Username should match");
    }

    @Test
    public void testLoginWithInvalidCredentials() {
        // Arrange
        LoginRequestDTO request = new LoginRequestDTO("wronguser", "wrongpass");

        // Act
        UserDTO result = userService.login(request);

        // Assert
        Assertions.assertNull(result, "User should be null for invalid credentials");
    }

    @Test
    public void testLoginWithNullUsername() {
        // Arrange
        LoginRequestDTO request = new LoginRequestDTO(null, "somepass");

        // Act
        UserDTO result = userService.login(request);

        // Assert
        Assertions.assertNull(result, "User should be null when username is null");
    }

    @Test
    public void testLoginWithNullPassword() {
        // Arrange
        LoginRequestDTO request = new LoginRequestDTO("admin", null);

        // Act
        UserDTO result = userService.login(request);

        // Assert
        Assertions.assertNull(result, "User should be null when password is null");
    }
}

