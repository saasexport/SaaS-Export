package cn.itcast.service.cargo.impl;

import cn.itcast.dao.cargo.ExportDao;
import cn.itcast.dao.cargo.PackingListDao;
import cn.itcast.domain.cargo.Export;
import cn.itcast.domain.cargo.PackingList;
import cn.itcast.domain.cargo.PackingListExample;
import cn.itcast.service.cargo.PackingListService;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.UUID;

@Service
public class PackingListServiceImpl implements PackingListService {

    @Autowired
    private PackingListDao packingListDao;

    @Autowired
    private ExportDao exportDao;


    public PageInfo findAll(Integer page, Integer size, PackingListExample example) {
        PageHelper.startPage(page, size);
        List<PackingList> list = packingListDao.selectByExample(example);
        return new PageInfo(list);
    }


    public PackingList findById(String id) {
        return packingListDao.selectByPrimaryKey(id);
    }


    public void save(PackingList packingList) {
        packingList.setPackingListId(UUID.randomUUID().toString());
        packingList.setState(0);
        packingListDao.insert(packingList);
        String exportIds = packingList.getExportIds();
        String[] ids = exportIds.split(",");
        for (String id : ids) {
            Export export = new Export();
            export.setId(id);
            export.setState(4);
            exportDao.updateByPrimaryKeySelective(export);
        }
    }

    //更新方法

    public void update(PackingList packingList) {
        packingListDao.updateByPrimaryKeySelective(packingList);

    }


    public void delete(String id) {
        packingListDao.deleteByPrimaryKey(id);

    }
}
