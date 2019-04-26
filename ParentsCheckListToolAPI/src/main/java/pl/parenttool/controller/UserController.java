package pl.parenttool.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import pl.parenttool.model.entity.User;
import pl.parenttool.service.UserService;

import java.util.List;

@RestController
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    // retrieve all user data after login
    @RequestMapping(value = "/userData", method = RequestMethod.GET)
    @ResponseBody
    public User getUserDetails(@RequestParam(value = "login", required = true) String login) {
        return userService.getUserByLogin(login);
    }

    // get all users for admin purposes
    @RequestMapping(value = "/usersAll", method = RequestMethod.GET)
    @ResponseBody
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }
}
