package cn.itcast.dao.system;

import cn.itcast.domain.system.Dept;

import java.util.List;

public interface DeptDao {

    //查询所有
    List<Dept> findAll(String companyId);

    //保存部门信息
    void save(Dept dept);

    //通过id进行查询
    Dept findById(String id);

    //更新部门信息
    void update(Dept dept);

    //删除
    void delete(String id);
}
