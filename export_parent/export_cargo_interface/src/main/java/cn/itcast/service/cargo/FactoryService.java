package cn.itcast.service.cargo;

import cn.itcast.domain.cargo.Factory;
import cn.itcast.domain.cargo.FactoryExample;

import java.util.List;

public interface FactoryService {

    //查询所有工厂信息
    List<Factory> findAll(FactoryExample example);
}
