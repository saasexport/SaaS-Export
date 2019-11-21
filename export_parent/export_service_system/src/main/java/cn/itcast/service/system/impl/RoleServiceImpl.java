package cn.itcast.service.system.impl;

import cn.itcast.dao.system.RoleDao;
import cn.itcast.domain.system.Role;
import cn.itcast.service.system.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    //分页查询所有
    public PageInfo findAll(String companyId, int page, int size) {
        PageHelper.startPage(page, size);
        List<Role> list = roleDao.findAll(companyId);
        return new PageInfo(list);
    }

    //根据id进行查询
    public Role findById(String id) {
        return roleDao.findById(id);
    }

    //保存
    public int save(Role role) {
        role.setId(UUID.randomUUID().toString());
        return roleDao.save(role);
    }

    //更新
    public int update(Role role) {
        return roleDao.update(role);
    }

    //删除
    public int delete(String id) {
        return roleDao.delete(id);
    }

    //查询所有角色不分页
    public List<Role> findAll(String companyId) {
        return roleDao.findAll(companyId);
    }

    //通过用户id查询该用户的所有角色
    public List<Role> findByUserId(String id) {
        return roleDao.findByUserId(id);
    }

    //更新用户新的角色
    public void changeRole(String userid, String[] roleIds) {
        //1、先通过userid进行删除
        roleDao.deleteByUserId(userid);

        //2、循环roleIds，写入用户角色中间表
        for (String roleId : roleIds) {
            roleDao.insertUserRole(userid, roleId);
        }
    }
}
