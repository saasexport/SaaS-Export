package cn.itcast.dao.system;

import cn.itcast.domain.system.Module;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 */
public interface ModuleDao {

    //根据id查询
    Module findById(String moduleId);

    //根据id删除
    int delete(String moduleId);

    //添加用户
    int save(Module module);

    //更新用户
    int update(Module module);

    //查询全部
    List<Module> findAll();

    //通过角色查找模块信息
    List<Module> findModuleByRoleId(String roleId);

    //通过角色删除所有角色的模块信息
    void deleteByRoleId(String roleid);

    //写入角色的新模块信息
    void insertRoleModule(@Param("roleId") String roleid, @Param("moduleId") String moduleId);

    //通过用户的degree查询所有模块信息
    List<Module> findByDegree(Integer belong);

    //通过用户的id查询该用户具有的模块
    List<Module> findModuleByUserId(String userId);
}