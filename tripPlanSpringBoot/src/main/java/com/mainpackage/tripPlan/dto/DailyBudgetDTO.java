package com.mainpackage.tripPlan.dto;

import java.math.BigDecimal;
import java.util.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
public class DailyBudgetDTO {
    
    public Integer id;
    public BigDecimal dayBudget;
    public Date date;

    public DailyBudgetDTO(Integer id, BigDecimal dayBudget, Date date) {
        this.id = id;
        this.dayBudget = dayBudget;
        this.date = date;
    }
    
}
