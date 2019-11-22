package cn.itcast.dao.cargo;



import cn.itcast.domain.cargo.ShippingOrder;
import cn.itcast.domain.cargo.ShippingOrderExample;

import java.util.List;

public interface ShippingOrderDao {
    //删除委托单
    int deleteByPrimaryKey(String shippingOrderId);
    //添加委托单
    int insert(ShippingOrder record);
    //添加委托单
    int insertSelective(ShippingOrder record);
    //查询委托单列表
    List<ShippingOrder> selectByExample(ShippingOrderExample example);
    //查询委托单列表
    ShippingOrder selectByPrimaryKey(String shippingOrderId);
    //更新委托单信息22
    int updateByPrimaryKeySelective(ShippingOrder record);

}