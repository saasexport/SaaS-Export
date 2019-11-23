package cn.itcast.service.cargo;

import cn.itcast.domain.cargo.PackingList;
import cn.itcast.domain.cargo.PackingListExample;
import com.github.pagehelper.PageInfo;


public interface PackingListService {

    PageInfo findAll(Integer page, Integer size, PackingListExample example);

    PackingList findById(String id);

    void save(PackingList packingList);

    void update(PackingList packingList);

    void delete(String id);

}
