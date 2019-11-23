package cn.itcast.service.system.impl;

import cn.itcast.dao.system.FeedBackDao;
import cn.itcast.domain.system.FeedBack;
import cn.itcast.domain.system.FeedBackExample;
import cn.itcast.service.system.FeedBackService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @ProjectName: export_parent
 * @Package: cn.itcast.service.system.impl
 * @ClassName: FeedBackServiceImpl
 * @Author: chenxi
 * @Description:
 * @Date: 2019/11/21 17:42
 * @Version: 1.0
 */
@Service
public class FeedBackServiceImpl implements FeedBackService {

    @Autowired
    private FeedBackDao feedBackDao;


    public void save(FeedBack feedBack) {


        feedBack.setFeedbackId(UUID.randomUUID().toString());
        feedBack.setCreateTime(new Date());
        feedBack.setInputTime(new Date());
        feedBackDao.insert(feedBack);

    }

    public PageInfo findAll(FeedBackExample feedBackExample, int page, int size) {
        PageHelper.startPage(page, size);

        List<FeedBack> feedBacks = feedBackDao.selectByExample(feedBackExample);

        return new PageInfo(feedBacks);
    }

    public void delete(String id) {
        feedBackDao.deleteByPrimaryKey(id);
    }

    public FeedBack findById(String id) {

        return feedBackDao.selectByPrimaryKey(id);
    }

    public void updateFeedback(FeedBack feedBack) {
        feedBack.setState("1");
        feedBackDao.updateByPrimaryKeySelective(feedBack);

    }

    public List<FeedBack> findByState(FeedBackExample feedBackExample) {


        return feedBackDao.selectByExample(feedBackExample);
    }
}
