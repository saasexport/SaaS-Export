package cn.itcast.service.cargo.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.itcast.dao.cargo.ExportDao;
import cn.itcast.dao.cargo.InvoiceDao;
import cn.itcast.dao.cargo.PackingListDao;
import cn.itcast.domain.cargo.Export;
import cn.itcast.domain.cargo.Invoice;
import cn.itcast.domain.cargo.InvoiceExample;
import cn.itcast.domain.cargo.PackingList;
import cn.itcast.service.cargo.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class InvoiceServiceImpl implements InvoiceService {

    @Autowired
    private InvoiceDao invoiceDao;
    @Autowired
    private PackingListDao packingListDao;
    @Autowired
    private ExportDao exportDao;

    public PageInfo findAll(InvoiceExample example, int page, int size) {

        PageHelper.startPage(page, size);
        List<Invoice> list = invoiceDao.selectByExample(example);
        return new PageInfo(list);

    }

    public Invoice findById(String id) {

        return invoiceDao.selectByPrimaryKey(id);

    }

    public void save(Invoice invoice) {

        invoice.setState(0);
        invoiceDao.insertSelective(invoice);

        PackingList packingList = packingListDao.selectByPrimaryKey(invoice.getInvoiceId());

        if(packingList != null){

            String exportIds = packingList.getExportIds();
            String[] ids = exportIds.split(",");
            for (String id : ids) {
                Export export = new Export();
                export.setId(id);
                export.setState(5);
                exportDao.updateByPrimaryKeySelective(export);
            }

        }

    }

    public void update(Invoice invoice) {

        invoiceDao.updateByPrimaryKeySelective(invoice);

    }

    public void delete(String invoiceId) {

        invoiceDao.deleteByPrimaryKey(invoiceId);

    }

    public List<Invoice> findByState(InvoiceExample example) {

        return invoiceDao.selectByExample(example);

    }

    public List<Invoice> findByState(int state) {

        return invoiceDao.findByState(state);

    }

}
