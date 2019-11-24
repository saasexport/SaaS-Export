package cn.itcast.service.cargo.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.itcast.dao.cargo.FactoryDao;
import cn.itcast.domain.cargo.Factory;
import cn.itcast.domain.cargo.FactoryExample;
import cn.itcast.service.cargo.FactoryService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class FactoryServiceImpl implements FactoryService{

    @Autowired
    private FactoryDao factoryDao;

    public List<Factory> findFactories(FactoryExample example) {

        return factoryDao.selectByExample(example);

    }

    public void deleteByPrimaryKey(String id) {
        factoryDao.deleteByPrimaryKey(id);

    }

    public void insertSelective(Factory record) {
        record.setId(UUID.randomUUID().toString());
        factoryDao.insertSelective(record);
    }

    public List<Factory> selectByExample(FactoryExample example) {

        return factoryDao.selectByExample(example);

    }

    public Factory selectByPrimaryKey(String id) {

        return factoryDao.selectByPrimaryKey(id);

    }

    public void updateByPrimaryKeySelective(Factory record) {

        factoryDao.updateByPrimaryKeySelective(record);

    }

    //分页查询的条件查询
    public PageInfo findAll(FactoryExample example, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Factory> list = factoryDao.selectByExample(example);
        return new PageInfo(list);
    }

    //保存新增厂家
    public void save(Factory factory) {

        factory.setId(UUID.randomUUID().toString());
        factory.setCreateTime(new Date());
        factory.setUpdateTime(new Date());
        factoryDao.insertSelective(factory);

    }

    //更新厂家信息
    public void update(Factory factory) {

        factory.setUpdateTime(new Date());
        factoryDao.updateByPrimaryKeySelective(factory);

    }

    public List<Factory> findAll(FactoryExample example) {

        return factoryDao.selectByExample(example);

    }

}
