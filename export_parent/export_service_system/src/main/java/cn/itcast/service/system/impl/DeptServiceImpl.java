package cn.itcast.service.system.impl;

import cn.itcast.dao.system.DeptDao;
import cn.itcast.domain.system.Dept;
import cn.itcast.service.system.DeptService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DeptServiceImpl implements DeptService{

    @Autowired
    private DeptDao deptDao;

    public PageInfo findAll(String companyId, int page, int size) {
        PageHelper.startPage(page, size);
        List<Dept> list = deptDao.findAll(companyId);
        return new PageInfo(list);
    }

    //查询所有部门，用于父部门列表选择
    public List<Dept> findAll(String companyId) {
        return deptDao.findAll(companyId);
    }

    public void save(Dept dept) {
        dept.setId(UUID.randomUUID().toString());
        if (StringUtil.isEmpty(dept.getParent().getId())){
            dept.setParent(null);
        }
        deptDao.save(dept);
    }

    //通过id进行查询
    public Dept findById(String id) {
        return deptDao.findById(id);
    }

    //更新部门信息
    public void update(Dept dept) {
        deptDao.update(dept);
    }

    public void delete(String id) {
        deptDao.delete(id);
    }
}
