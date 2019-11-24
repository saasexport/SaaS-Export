package com.itcast.service.message;

import cn.itcast.domain.message.Product;
import cn.itcast.domain.message.ProductExample;
import com.github.pagehelper.PageInfo;


public interface ProductService {

    PageInfo findAll(ProductExample productExample, Integer page, Integer size);

    void save(Product Product);

    Product findById(String id);

    void update(Product Product);

    void delete(String id);

}
