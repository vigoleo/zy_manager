package net.wanho.controller;

import net.wanho.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by silen on 2018/3/21.
 */
@Controller("/user")
public class UserController {
    @Autowired
    private IUserService userServiceImpl;
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }
}
