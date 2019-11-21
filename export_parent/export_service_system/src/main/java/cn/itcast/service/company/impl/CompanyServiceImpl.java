package cn.itcast.service.company.impl;

import cn.itcast.common.entity.PageResult;
import cn.itcast.dao.company.CompanyDao;
import cn.itcast.domain.company.Company;
import cn.itcast.service.company.CompanyService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDao companyDao;


    //查询所有企业（int page, int size）
    public List<Company> findAll() {

        //分页查询
        //long total = select Count(*) from ss_company,
        //List rows = SELECT * FROM ss_company LIMIT ((page-1)*size, size)
        //PageResult(long total, List rows, int page, int size)
        //PageResult


        return companyDao.findAll();
    }

    //保存企业信息
    public void save(Company company) {
        company.setId(UUID.randomUUID().toString());
        companyDao.save(company);
    }

    public Company findById(String id) {
        return companyDao.findById(id);
    }

    //修改企业信息
    public void update(Company company) {
        companyDao.update(company);
    }

    //通过id删除企业信息
    public void delete(String id) {
        companyDao.delete(id);
    }

    //分页查询
    public PageResult findByPage(int page, int size) {

        //long total, List rows, int page, int size

        //total 总数量：
        long total = companyDao.findCount(); //查询有多少条记录
        List rows = companyDao.findPage((page-1)*size, size);  //分页查询每一页的列表
        PageResult pageResult = new PageResult(total, rows, page, size);
        return pageResult;
    }

    public PageInfo findByHelper(int page, int size) {
        //1、PageHelper.startPage
        PageHelper.startPage(page, size);
        //2、紧跟着List，findAll
        List<Company> list = companyDao.findAll();
        //3、new PageInfo(list)
        return new PageInfo(list);
    }
}
