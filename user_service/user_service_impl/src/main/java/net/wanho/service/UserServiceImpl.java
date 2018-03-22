package net.wanho.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.wanho.mapper.UserMapper;
import net.wanho.pojo.Result;
import net.wanho.pojo.User;
import net.wanho.pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by silen on 2018/3/20.
 */
@Service("userServiceImpl")
public class UserServiceImpl implements IUserService{
    @Autowired
    private UserMapper userMapper;
    @Override
    public int addUser(User user) {
        int flag=userMapper.insert(user);
        return flag;
    }

    @Override
    public Result login(User user) {
        Result result=new Result();
        UserExample example=new UserExample();
        example.createCriteria().andNameEqualTo(user.getName()).andPasswordEqualTo(user.getPassword());
        List<User> list=userMapper.selectByExample(example);
        if(list!=null&&list.size()>0){
            result.setObject(list.get(0));
            result.setStatus(200);
        }else {
            result.setStatus(400);
        }
        return result;
    }

    @Override
    public PageInfo<User> queryUserList(Integer pageNum, User user) {
        PageHelper.startPage(pageNum,2);
        List<User> userList=userMapper.queryByUser(user);
        PageInfo<User> pageInfo=new PageInfo<>(userList);
        return pageInfo;
    }

    @Override
    public int updateUser(User user) {
        return  userMapper.updateByPrimaryKey(user);

    }

    @Override
    public User queryOne(User user) {
        return userMapper.selectByPrimaryKey(user.getId());
    }

    @Override
    public int doDelete(User user) {
        return userMapper.deleteByPrimaryKey(user.getId());
    }
}
