package cn.itcast.service.stat.impl;

import cn.itcast.dao.stat.StatDao;
import cn.itcast.service.stat.StatService;
import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@Service
public class StatServiceImpl implements StatService {

    @Autowired
    private StatDao statDao;


    public List<Map> getFactoryData(String companyId) {
        return statDao.getFactoryData(companyId);
    }

    public List<Map> getSellData(String companyId) {
        return statDao.getSellData(companyId);
    }

    public List<Map> getOnlineData(String companyId) {
        return statDao.getOnlineData(companyId);
    }

    public List<Map> getMakertData(String companyId) {
        return statDao.getMakertData(companyId);
    }

    //获取访问IP前十名(高策)
    public List<Map> getIpRankData(String companyId) {
        return statDao.getIpRankData(companyId);
    }
}
