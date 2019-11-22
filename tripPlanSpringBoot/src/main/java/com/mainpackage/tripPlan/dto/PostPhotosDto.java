/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.dto;

import com.mainpackage.tripPlan.model.Photo;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PostPhotosDto {

    int tripId;
    Photo photos;

    public PostPhotosDto(int tripId, Photo photos) {
        this.tripId = tripId;
        this.photos = photos;
    }

    
}
