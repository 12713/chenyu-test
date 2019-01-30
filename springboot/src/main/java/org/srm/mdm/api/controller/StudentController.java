package org.srm.mdm.api.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.srm.mdm.app.service.StudentService;
import org.srm.mdm.domain.entity.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wangchenyu on 2019/1/25.
 */

/**
 * 增删改查demo
 */
@RestController
@RequestMapping("/srm")
public class StudentController {
    @Autowired
    private StudentService studentService;
    /**
     * 查询
     */
    @ResponseBody
    @RequestMapping("/search")
    public Map<String, Object>  search(int page,int rows){
        Map<String ,Object> map=new HashMap<String,Object>();
        map.put("page",(page-1)*rows);
        map.put("rows",rows);
        List<User> user=studentService.search(map);
        int count=studentService.count();
        Map<String,Object> maps = new HashMap<String, Object>();
        map.put("rows", user);
        map.put("total",count);
        return map;
    }
    /**
     * pagehelper分页查询
     */
    @ResponseBody
    @RequestMapping("/search1")
    public Map<String,Object>  search1(int page,int rows){
        PageHelper.startPage(page,rows);
        Map<String ,Object> map=new HashMap<String,Object>();
        map.put("page",page);
        map.put("rows",rows);
        List<User> appsList = studentService.search(map);
        PageInfo<User> appsPageInfo = new PageInfo<>(appsList);
        //得到分页中的person条目对象
        List<User> pageList = appsPageInfo.getList();
        int count=studentService.count();
        //将结果存入map进行传送
        map.put("rows" , pageList);
        map.put("total",count);
        return map;
    }

    /**
     * 增加和修改
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/save-or-update")
    public int saveOrUpdate(User user){
        try {
            studentService.saveorupdate(user);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

    }

    /**
     * 查询
     * @param id
     */
    @ResponseBody
    @RequestMapping("/list")
    public User list(int id){
        User list=studentService.list(id);
        return  list;
    }

    /**
     * 删除
     * @param uids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delete")
    public int delete(String  uids){
        String id1=uids.substring(0,uids.length()-1);
        String [] id=id1.split(",");
        try {
            studentService.delete(id);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
