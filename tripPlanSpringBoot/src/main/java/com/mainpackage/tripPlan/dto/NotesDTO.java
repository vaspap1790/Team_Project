package com.mainpackage.tripPlan.dto;

import java.util.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class NotesDTO {
    
    public Integer id;
    public String title;
    public String body;
    public Date date;

    public NotesDTO(Integer id, String title, String body, Date date) {
        this.id = id;
        this.title = title;
        this.body = body;
        this.date = date;
    }   
}
