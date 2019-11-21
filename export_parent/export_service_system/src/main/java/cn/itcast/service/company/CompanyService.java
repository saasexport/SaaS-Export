package cn.itcast.service.company;

import cn.itcast.common.entity.PageResult;
import cn.itcast.domain.company.Company;
import com.github.pagehelper.PageInfo;

import java.util.List;

//service接口
public interface CompanyService {

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

    //分页查询企业列表
    PageResult findByPage(int page, int size);

    //通过PageHelper进行分页
    PageInfo findByHelper(int page, int size);
}
