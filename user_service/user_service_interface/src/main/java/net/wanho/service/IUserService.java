package net.wanho.service;

import com.github.pagehelper.PageInfo;
import net.wanho.pojo.Result;
import net.wanho.pojo.User;

/**
 * Created by silen on 2018/3/20.
 */
public interface IUserService {
    int addUser(User user);

    Result login(User user);

    PageInfo<User> queryUserList(Integer pageNum, User user);

    int updateUser(User user);

    User queryOne(User user);

    int doDelete(User user);
}
