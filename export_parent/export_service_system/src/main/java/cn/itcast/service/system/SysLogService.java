package cn.itcast.service.system;

import cn.itcast.domain.system.SysLog;
import com.github.pagehelper.PageInfo;

public interface SysLogService {

    //分页查询所有日志
    PageInfo findAll(String companyId, int page, int size);

    //保存日志
    int save(SysLog sysLog);
}
