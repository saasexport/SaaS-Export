package cn.itcast.service.system.impl;

import cn.itcast.common.utils.Encrypt;
import cn.itcast.dao.system.UserDao;
import cn.itcast.domain.system.User;
import cn.itcast.service.system.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    public PageInfo findAll(String companyId, int page, int size) {
        PageHelper.startPage(page, size);
        List<User> list = userDao.findAll(companyId);
        return new PageInfo(list);
    }

    //查询所有用户，用于父用户列表选择
    public List<User> findAll(String companyId) {
        return userDao.findAll(companyId);
    }

    public void save(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setPassword(Encrypt.md5(user.getPassword(), user.getEmail()));
        userDao.save(user);
    }

    //通过id进行查询
    public User findById(String id) {
        return userDao.findById(id);
    }

    //更新用户信息
    public void update(User user) {
        user.setPassword(Encrypt.md5(user.getPassword(), user.getEmail()));
        userDao.update(user);
    }

    public void delete(String id) {
        userDao.delete(id);
    }

    //通过email查询用户信息
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    public String findSaasEmail(int degree) {
        return userDao.findSaasEmail(degree);
    }
}
