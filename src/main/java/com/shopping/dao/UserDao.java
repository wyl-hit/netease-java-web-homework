package com.shopping.dao;

import com.shopping.entity.User;

import java.util.List;

/**
 * Created by wyl on 2018/3/1.
 */
public interface UserDao {

    public User getUser(int id);

    public User getUser(String nameOrEmail);

    public void addUser(User user);

    public boolean deleteUser(int id);

    public boolean updateUser(User user);

    public List<User> getAllUser();
}
