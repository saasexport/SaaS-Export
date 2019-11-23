package cn.itcast.service.cargo.impl;

import cn.itcast.dao.cargo.ExportDao;
import cn.itcast.dao.cargo.PackingListDao;
import cn.itcast.dao.cargo.ShippingOrderDao;
import cn.itcast.domain.cargo.Export;
import cn.itcast.domain.cargo.PackingList;
import cn.itcast.domain.cargo.ShippingOrder;
import cn.itcast.domain.cargo.ShippingOrderExample;
import cn.itcast.service.cargo.ShippingOrderService;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

@Service
public class ShippingOrderServiceImpl implements ShippingOrderService {

    @Autowired
    private ShippingOrderDao shippingOrderDao;
    //装箱单dao
    @Autowired
    private PackingListDao packingListDao;
    @Autowired
    private ExportDao exportDao;

    //删除

    public void deleteByPrimaryKey(String shippingOrderId) {
        shippingOrderDao.deleteByPrimaryKey(shippingOrderId);
    }

    //插入

    public void insertSelective(ShippingOrder record) {
        shippingOrderDao.insertSelective(record);

    }

    //条件查询

    public List<ShippingOrder> selectByExample(ShippingOrderExample example) {
        return shippingOrderDao.selectByExample(example);
    }

    //主键查询

    public ShippingOrder selectByPrimaryKey(String shippingOrderId) {
        return shippingOrderDao.selectByPrimaryKey(shippingOrderId);
    }

    //更新

    public void updateByPrimaryKeySelective(ShippingOrder record) {
        shippingOrderDao.updateByPrimaryKeySelective(record);
    }

    //分页查询委托单

    public PageInfo findAll(ShippingOrderExample shippingOrderExample, int page, int size) {
        PageHelper.startPage(page, size);
        List<ShippingOrder> list = shippingOrderDao.selectByExample(shippingOrderExample);
        return new PageInfo(list);
    }



    //保存委托单,id是装箱单id

    public void save(ShippingOrder shippingOrder) {

        shippingOrder.setCreateTime(new Date());
        shippingOrderDao.insertSelective(shippingOrder);

      PackingList packingList = packingListDao.selectByPrimaryKey(shippingOrder.getShippingOrderId());
        String exportIds = packingList.getExportIds();
        String[] ids = exportIds.split(",");
        for (String id : ids) {
            Export export = new Export();
            export.setId(id);
            export.setState(5);
            exportDao.updateByPrimaryKeySelective(export);
        }
    }

    //更新委托单,id是装箱单id

    public void update(ShippingOrder shippingOrder) {
        shippingOrder.setUpdateTime(new Date());
        shippingOrderDao.updateByPrimaryKeySelective(shippingOrder);
    }

    // //更新之前回显委托单数据

    public ShippingOrder findById(String shippingOrderId) {
        return shippingOrderDao.selectByPrimaryKey(shippingOrderId);
    }

    //删除委托单

    public void delete(String shippingOrderId) {
        shippingOrderDao.deleteByPrimaryKey(shippingOrderId);
    }
}
