package com.icbt.service;

import com.icbt.dao.UserDAO;
import com.icbt.dto.LoginRequestDTO;
import com.icbt.dto.UserDTO;
import com.icbt.model.User;

public class UserService {
    public final UserDAO userDAO;


    public UserService() {
        this.userDAO = new UserDAO();
    }


    public UserDTO login(LoginRequestDTO loginRequestDTO) {
        User user = userDAO.checkUser(loginRequestDTO.getUsername(), loginRequestDTO.getPassword());

        if (user != null) {
            return new UserDTO(
                    user.getId(),
                    user.getUsername()
            );
        }
        return null;
    }
}
