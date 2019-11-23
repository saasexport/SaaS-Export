package cn.itcast.service.cargo;

import com.github.pagehelper.PageInfo;
import cn.itcast.domain.cargo.Invoice;
import cn.itcast.domain.cargo.InvoiceExample;

import java.util.List;

public interface InvoiceService {

    //查询列表分页
    PageInfo findAll(InvoiceExample example, int page, int size);

    //根据id查询
    Invoice findById(String id);

    //保存
    void save(Invoice invoice);

    //更新
    void update(Invoice invoice);

    //删除
    void delete(String invoiceId);

    List<Invoice> findByState(InvoiceExample example);

    List<Invoice> findByState(int state);

}
