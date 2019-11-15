/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.DummyModels;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import java.math.BigDecimal;
import java.sql.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@JsonPropertyOrder({"dayBudget", "tripId","date"})
public class DummyDailyBudget {
    
    public BigDecimal dayBudget;
    public int tripId;
    public Date date;

    public DummyDailyBudget(BigDecimal dayBudget, int tripId, Date date) {
        this.dayBudget = dayBudget;
        this.tripId = tripId;
        this.date = date;
    }

    @Override
    public String toString() {
        return "DummyDailyBudget{" + "dayBudget=" + dayBudget + ", tripId=" + tripId + ", date=" + date + '}';
    }
    
    
}
