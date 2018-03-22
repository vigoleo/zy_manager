package net.wanho.interceptors;

import net.wanho.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by silen on 2018/3/21.
 */
public class PermissionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if (url.indexOf("toLogin") >= 0 || url.indexOf("login") >= 0
                ||url.equals("/")||url.indexOf("toRegister")>=0||url.indexOf("register")>=0) {
            return true;
        }
        User loginUser = (User) request.getSession().getAttribute("activeUser");
        if (loginUser != null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
