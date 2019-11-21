package cn.itcast.dao.company;

import cn.itcast.domain.company.Company;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//dao接口
public interface CompanyDao {

    //查询所有企业
    List<Company> findAll();

    //保存企业信息
    void save(Company company);

    //通过id查询企业信息
    Company findById(String id);

    //修改企业信息
    void update(Company company);

    //通过id删除企业信息
    void delete(String id);

    //查询所有记录
    long findCount();

    //分页查询每一页的列表
    //   index:1, size:5
    List findPage(@Param("index") int index, @Param("size") int size);
}
