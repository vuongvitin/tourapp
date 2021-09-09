/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository;

import com.mycompany.pojos.User;
import java.util.List;



/**
 *
 * @author PC
 */
public interface UserRepository {
    boolean addUser(User user);
    List<User> getUser(String username);
}
