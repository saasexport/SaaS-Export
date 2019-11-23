package cn.itcast.service.cargo;

import com.github.pagehelper.PageInfo;
import cn.itcast.domain.cargo.Finance;
import cn.itcast.domain.cargo.FinanceExample;

public interface FinanceService {

    //查询列表分页
    PageInfo findAll(FinanceExample example, int page, int size);

    //根据id查询
    Finance findById(String id);

    //保存
    void save(Finance finance);

    //更新
    void update(Finance finance);

    //删除
    void delete(String financeId);

}
