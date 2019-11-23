package cn.itcast.service.cargo.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.itcast.dao.cargo.ExportDao;
import cn.itcast.dao.cargo.FinanceDao;
import cn.itcast.dao.cargo.PackingListDao;
import cn.itcast.domain.cargo.Export;
import cn.itcast.domain.cargo.Finance;
import cn.itcast.domain.cargo.FinanceExample;
import cn.itcast.domain.cargo.PackingList;
import cn.itcast.service.cargo.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class FinanceServiceImpl implements FinanceService {

    @Autowired
    private FinanceDao financeDao;
    @Autowired
    private PackingListDao packingListDao;
    @Autowired
    private ExportDao exportDao;

    public PageInfo findAll(FinanceExample example, int page, int size) {

        PageHelper.startPage(page, size);
        List<Finance> list = financeDao.selectByExample(example);
        return new PageInfo(list);

    }

    public Finance findById(String id) {

        return financeDao.selectByPrimaryKey(id);

    }

    public void save(Finance finance) {

        finance.setState(0);
        financeDao.insertSelective(finance);

        PackingList packingList = packingListDao.selectByPrimaryKey(finance.getFinanceId());

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

    public void update(Finance finance) {

        financeDao.updateByPrimaryKeySelective(finance);

    }

    public void delete(String financeId) {

        financeDao.deleteByPrimaryKey(financeId);

    }

}
