package cn.itcast.service.cargo;

import cn.itcast.domain.cargo.ContractProduct;
import cn.itcast.domain.cargo.ContractProductExample;
import cn.itcast.domain.vo.ContractProductVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

//合同对应的货物service接口
public interface ContractProductService {

    //分页查询货物列表
    PageInfo findAll(ContractProductExample example, int page, int size);

    //保存合同信息
    void save(ContractProduct contractProduct);

    //通过id进行查询
    ContractProduct findById(String id);

    //更新合同信息
    void update(ContractProduct contractProduct);

    //通过id进行删除
    void delete(String id);

    //通过船期查询货物列表
    List<ContractProductVo> findByShipTime(String inputDate);
}
