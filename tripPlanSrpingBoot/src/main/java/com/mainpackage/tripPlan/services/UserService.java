
package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Admin;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.AdminRepo;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.utilities.Check;
import com.mainpackage.tripPlan.utilities.Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserService {

    @Autowired
    GenericJpaDao<User> userDao;
    @Autowired
    Encryption encrypt;
    @Autowired
    UserRepo userRepo;
    @Autowired
    AdminRepo adminRepo;
    @Autowired
    Check check;


    public void insert(User u) {

        String hashed = encrypt.hashPassword(u.getPassword());
        u.setPassword(hashed);

        userDao.save(u);

    }

    public String postLogIn(String username, String password) {

        String role = "Not registered";
        User u = userRepo.findByUsername(username);
        Admin a = adminRepo.findByAdminName(username);

        if (check.isNotNull(u)) {
            if (encrypt.checkPassword(password, u.getPassword())) {
                role = "User";
            }
        }
        
        if (check.isNotNull(a)) {
            if (encrypt.checkPassword(password, a.getPassword())) {
                role = "Admin";
            }
        }

        return role;
    }

}