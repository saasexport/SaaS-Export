package cn.itcast.service.system;

import cn.itcast.domain.system.Dept;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface DeptService {

    //分页，查哪个企业，页码，当前页条数
    PageInfo findAll(String companyId, int page, int size);

    //查询所有部门，用于父部门列表选择
    List<Dept> findAll(String companyId);

    //保存部门信息
    void save(Dept dept);

    //通过id进行查询
    Dept findById(String id);

    //更新部门信息
    void update(Dept dept);

    //通过id进行删除
    void delete(String id);
}
