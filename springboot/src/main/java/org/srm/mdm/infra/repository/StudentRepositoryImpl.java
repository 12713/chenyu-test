package org.srm.mdm.infra.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.srm.mdm.domain.entity.User;
import org.srm.mdm.domain.repository.StudentRepository;
import org.srm.mdm.infra.mapper.StudentMapper;

import java.util.List;
import java.util.Map;

/**
 * Created by wangchenyu on 2019/1/25.
 */
@Component
public class StudentRepositoryImpl  implements StudentRepository{
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<User> search(Map map) {
        List<User> list=studentMapper.search(map);
        return list;
    }
    @Override
    public int count() {
        return studentMapper.count();
    }
    @Override
    public void saveorupdate(User user) {
        if (user.getAuthorityId()==null){
            studentMapper.insert(user);
        }else{
            studentMapper.update(user);
        }
    }
    @Override
    public User list(int id) {
        return studentMapper.list(id);
    }
    @Override
    public void delete(String[] id) {
        studentMapper.delete(id);
    }
}
