package cn.itcast.service.system;

import cn.itcast.domain.system.Role;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface RoleService {

    //分页查询所有
    PageInfo findAll(String companyId, int page, int size);

    //根据id进行查询
    Role findById(String id);

    //保存
    int save(Role role);

    //更新
    int update(Role role);

    //删除
    int delete(String id);

    //查询所有角色不分页
    List<Role> findAll(String companyId);

    //通过用户id查询该用户的所有角色
    List<Role> findByUserId(String id);

    //更新用户新的角色
    void changeRole(String userid, String[] roleIds);
}
