package com.shopping.dao;

import com.shopping.entity.UserDetail;

import java.util.List;

/**
 * Created by wyl on 2018/3/1.
 */
public interface UserDetailDao {

    public UserDetail getUserDetail(int id);

    public void addUserDetail(UserDetail userDetail);

    public boolean deleteUserDetail(int id);

    public boolean updateUserDetail(UserDetail userDetail);

    public List<UserDetail> getAllUserDetail();
}
