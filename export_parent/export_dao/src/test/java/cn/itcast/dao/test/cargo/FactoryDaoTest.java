package cn.itcast.dao.test.cargo;

import cn.itcast.dao.cargo.FactoryDao;
import cn.itcast.domain.cargo.Factory;
import cn.itcast.domain.cargo.FactoryExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/spring/applicationContext-*.xml")
public class FactoryDaoTest {

    @Autowired
    private FactoryDao factoryDao;

    @Test
    public void testInsert(){
        Factory factory = new Factory();
        factory.setId(UUID.randomUUID().toString());
        factory.setCreateTime(new Date());
        factory.setUpdateTime(new Date());
        factory.setFactoryName("菜20");
        factoryDao.insertSelective(factory);
        //insertSelective
    }

    @Test
    public void testUpdate(){
        Factory factory = new Factory();
        factory.setId("8edf679c-0a8c-4c51-ba50-749f6e315d27");
        factory.setCreateTime(new Date());
        factory.setUpdateTime(new Date());
        factory.setFactoryName("菜10");
        factoryDao.updateByPrimaryKeySelective(factory);
        //updateByPrimaryKeySelective
    }


    @Test
    public void testSelect(){
        /*Factory factory = factoryDao.selectByPrimaryKey("8edf679c-0a8c-4c51-ba50-749f6e315d27");
        System.out.println(factory.toString());*/

        FactoryExample example = new FactoryExample();
        FactoryExample.Criteria criteria = example.createCriteria();
        criteria.andFactoryNameEqualTo("菜10");
        factoryDao.selectByExample(example);
    }
}
