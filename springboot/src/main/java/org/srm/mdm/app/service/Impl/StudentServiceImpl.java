package org.srm.mdm.app.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.srm.mdm.app.service.StudentService;
import org.srm.mdm.domain.entity.User;
import org.srm.mdm.domain.repository.StudentRepository;

import java.util.List;
import java.util.Map;

/**
 * Created by wangchenyu on 2019/1/25.
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentRepository studentRepository;

    @Override
    public  List<User> search(Map map) {
        List<User> list=studentRepository.search(map);
        return list;
    }

    @Override
    public int count() {
        return studentRepository.count();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveorupdate(User user) {
        studentRepository.saveorupdate(user);
    }

    @Override
    public User list(int id) {
        return studentRepository.list(id);
    }

    @Override
    public void delete(String[] id) {
        studentRepository.delete(id);
    }
}
