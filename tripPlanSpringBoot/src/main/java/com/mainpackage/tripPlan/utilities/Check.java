package com.mainpackage.tripPlan.utilities;

import com.mainpackage.tripPlan.model.Accommodation;
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
    
    public Accommodation checkAccommoName(Accommodation accommo){
        if(accommo.getAccommoName().length()>29){
            accommo.getAccommoName().substring(0, 29);
        }    
        return accommo ;
    }
}
