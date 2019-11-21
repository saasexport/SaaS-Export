package cn.itcast.dao.system;

import cn.itcast.domain.system.Role;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface RoleDao {

    //根据id查询
    Role findById(String id);

    //查询全部角色
    List<Role> findAll(String companyId);

	//根据id删除
    int delete(String id);

	//添加
    int save(Role role);

	//更新
    int update(Role role);

    //通过用户id查询该用户的所有角色
    List<Role> findByUserId(String id);

    //通过userid进行删除
    void deleteByUserId(String userid);

    //写入用户角色中间表
    void insertUserRole(@Param("userId") String userid, @Param("roleId") String roleId);
}