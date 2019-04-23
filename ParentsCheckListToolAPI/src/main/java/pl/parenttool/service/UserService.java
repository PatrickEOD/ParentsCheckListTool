package pl.parenttool.service;

import pl.parenttool.model.entity.User;

public interface UserService {

    User getUserByLogin(String login);
}
