package cn.itcast.service.cargo;


import com.github.pagehelper.PageInfo;
import cn.itcast.domain.cargo.Factory;
import cn.itcast.domain.cargo.FactoryExample;

import java.util.List;

/**
 *
 */
public interface FactoryService {

    /**
     * 查询所有厂家信息
     *
     * @param example
     * @return
     */
    List<Factory> findFactories(FactoryExample example);

    //删除
    void deleteByPrimaryKey(String id);

    //保存
    void insertSelective(Factory record);

    //条件查询
    List<Factory> selectByExample(FactoryExample example);

    //id查询
    Factory selectByPrimaryKey(String id);

    //更新
    void updateByPrimaryKeySelective(Factory record);

    //分页查询的条件查询
    PageInfo findAll(FactoryExample example, Integer page, Integer size);

    //保存新增厂家
    void save(Factory factory);

    //更新厂家信息
    void update(Factory factory);

    //查询所有工厂信息
    List<Factory> findAll(FactoryExample example);

}
