package net.wanho.controller;

import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.rngom.parse.host.Base;
import net.wanho.pojo.Result;
import net.wanho.pojo.User;
import net.wanho.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Enumeration;

/**
 * Created by silen on 2018/3/21.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @Autowired
    private IUserService userServiceImpl;

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "register";
    }

    /*Enumeration<String> paraNames = request.getParameterNames();
        for (Enumeration e = paraNames; e.hasMoreElements(); ) {
        String thisName = e.nextElement().toString();
        String thisValue = request.getParameter(thisName);
        System.out.println(thisName + "--------------" + thisValue);
    }*/
    @RequestMapping("/register")
    public String register(@RequestParam(value = "userfile", required = false) MultipartFile file,
                           User user, HttpServletRequest request) {
        String path = request.getSession().getServletContext().getRealPath("upload");
        try {
            path = URLDecoder.decode(path, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String fileName = System.currentTimeMillis() + file.getOriginalFilename();
        System.out.println(path + "------" + fileName);
        File targetFile = new File(path, fileName);
        /*如果不存在,创建目标文件*/
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        try {
            file.transferTo(targetFile);
            user.setAvatar("upload/" + fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        int flag = userServiceImpl.addUser(user);
        if (flag > 0) {
            return "redirect:toLogin";
        } else {
            return "error";
        }
    }

    @RequestMapping("/login")
    public String login(User user, Model model, HttpSession session) {
        Result result = userServiceImpl.login(user);
        if (result.getStatus() == 200) {
            session.setAttribute("activeUser", result.getObject());
            return "redirect:list";
        } else {
            model.addAttribute("msg", "用户登录失败");
            return "login";
        }
    }


    @RequestMapping("list")
    public String getUserList(@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum, User user, HttpServletRequest request) {
        PageInfo<User> pageInfo = userServiceImpl.queryUserList(pageNum, user);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("user", user);
        return "list";
    }

    @RequestMapping("toUpdate")
    public String toUpdate(User user, Model model) {
        User detail = userServiceImpl.queryOne(user);
        model.addAttribute("user", detail);
        return "update";
    }

    @RequestMapping("update")
    public String update(User user, HttpSession session) {
        int flag = userServiceImpl.updateUser(user);
        if (flag > 0) {
            session.removeAttribute("activeUser");
            return "redirect:toLogin";
        } else {
            return "error";
        }
    }

    @RequestMapping("doDelete")
    public String doDelete(User user, HttpSession session) {
        int flag = userServiceImpl.doDelete(user);
        if (flag > 0) {
            session.removeAttribute("activeUser");
            return "redirect:toLogin";
        } else {
            return "error";
        }
    }

}
