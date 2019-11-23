package cn.itcast.service.system;

import cn.itcast.domain.system.FeedBack;
import cn.itcast.domain.system.FeedBackExample;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @ProjectName: export_parent
 * @Package: cn.itcast.service.system
 * @ClassName: FeedBackService
 * @Author: chenxi
 * @Description:
 * @Date: 2019/11/21 17:42
 * @Version: 1.0
 */
public interface FeedBackService {

    /**
     * 添加反馈功能
     * @param feedBack
     */
    void save(FeedBack feedBack);

    PageInfo findAll(FeedBackExample feedBackExample, int page, int size);

    void delete(String id);

    FeedBack findById(String id);

    void updateFeedback(FeedBack feedBack);

    List<FeedBack> findByState(FeedBackExample feedBackExample);
}
