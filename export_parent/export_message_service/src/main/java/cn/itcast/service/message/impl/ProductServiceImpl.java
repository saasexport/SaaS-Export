package cn.itcast.service.message.impl;

import cn.itcast.dao.message.ProductDao;
import cn.itcast.domain.message.Product;
import cn.itcast.domain.message.ProductExample;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.itcast.service.message.ProductService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;


    public PageInfo findAll(ProductExample productExample, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Product> products = productDao.selectByExample(productExample);
        return new PageInfo(products);
    }


    public void save(Product product) {
        //设置id
        product.setId(UUID.randomUUID().toString());
        //设置录入时间
        product.setInputTime(new Date());
        product.setCreateTime(new Date());
        productDao.insertSelective(product);
    }


    public Product findById(String id) {
        return productDao.selectByPrimaryKey(id);
    }


    public void update(Product product) {
        productDao.updateByPrimaryKeySelective(product);
    }


    public void delete(String id) {
        productDao.deleteByPrimaryKey(id);
    }
}
