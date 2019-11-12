
package com.mainpackage.tripPlan.dto;

import java.math.BigDecimal;


public class TripDTO {
    
    public int id;
    public String location;
    public BigDecimal totalBudget;

    public TripDTO(int id, String location, BigDecimal totalBudget) {
        this.id = id;
        this.location = location;
        this.totalBudget = totalBudget;
    }

    public BigDecimal getTotalBudget() {
        return totalBudget;
    }

  

    public int getId() {
        return id;
    }

    public String getLocation() {
        return location;
    }
    
     
}
