
package com.mainpackage.tripPlan.dto;

import java.math.BigDecimal;
import java.util.Date;


public class AccommodationDTO {
    
    public String location;
    public String this1;
    public BigDecimal price;
    public String accommoName;
    public Date checkin;
    public Date checkout;

    public AccommodationDTO(String location, String this1, BigDecimal price, String accommoName, Date checkin, Date checkout) {
        this.location = location;
        this.this1 = this1;
        this.price = price;
        this.accommoName = accommoName;
        this.checkin = checkin;
        this.checkout = checkout;
    }

    public String getLocation() {
        return location;
    }

    public String getThis1() {
        return this1;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public String getAccommoName() {
        return accommoName;
    }

    public Date getCheckin() {
        return checkin;
    }

    public Date getCheckout() {
        return checkout;
    }
    
    
}
