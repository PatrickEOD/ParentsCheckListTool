package pl.parenttool.service;

import pl.parenttool.model.entity.User;

import java.util.List;

public interface UserService {

    User getUserByLogin(String login);

    List<User> getAllUsers();
}
