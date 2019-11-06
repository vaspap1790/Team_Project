package com.mainpackage.tripPlan.utilities;

import com.mainpackage.tripPlan.model.User;
import org.springframework.stereotype.Component;

@Component
public class Check {

    public boolean isNotNull(Object o) {
        return (o != null);
    }

    public boolean isUser(User user) {
        
        if (user.getRoleRef().getRoleId() == 2) {
            return true;
        }
        
        return false;

    }
}
