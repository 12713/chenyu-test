package org.srm.mdm.domain.repository;

import org.srm.mdm.domain.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by wangchenyu on 2019/1/25.
 */
public interface StudentRepository {

    List<User> search(Map map);

    int count();

    void saveorupdate(User user);

    User list(int id);

    void delete(String[] id);
}
