package cn.itcast.service.system;

import cn.itcast.domain.system.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UserService {

    //分页，查哪个企业，页码，当前页条数
    PageInfo findAll(String companyId, int page, int size);

    //查询所有部门，用于父部门列表选择
    List<User> findAll(String companyId);

    //保存部门信息
    void save(User user);

    //通过id进行查询
    User findById(String id);

    //更新部门信息
    void update(User user);

    //通过id进行删除
    void delete(String id);

    //通过email查询用户信息
    User findByEmail(String email);

   String findSaasEmail(int degree);

    User findByOpenId(String openId);

    void AddOpenId(String openId, String email);
}
