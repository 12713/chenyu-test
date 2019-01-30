package org.srm.mdm.infra.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.srm.mdm.domain.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by wangchenyu on 2019/1/25.
 */
@Mapper
@Repository
public interface StudentMapper {


    List<User> search(Map map);

    int count();

    void insert(User user);

    User list(int id);

    void update(User user);

    void delete(String[] id);
}
