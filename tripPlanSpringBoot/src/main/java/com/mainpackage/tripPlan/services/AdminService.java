
package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Admin;
import com.mainpackage.tripPlan.repositories.AdminRepo;
import com.mainpackage.tripPlan.utilities.Check;
import com.mainpackage.tripPlan.utilities.Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    @Autowired
    GenericJpaDao<Admin> adminDao;
    @Autowired
    Encryption encrypt;
    @Autowired
    AdminRepo adminRepo;
    @Autowired
    Check check;
    
        public void insert(Admin a) {

        String hashed = encrypt.hashPassword(a.getPassword());
        a.setPassword(hashed);

        adminDao.save(a);

    }
}
