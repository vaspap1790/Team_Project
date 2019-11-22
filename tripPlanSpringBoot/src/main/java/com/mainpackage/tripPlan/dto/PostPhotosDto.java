/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PostPhotosDto {

    int tripId;
    byte[]  photos;
    String finalPhoto;

    public PostPhotosDto(int tripId, byte[] photos) {
        this.tripId = tripId;
        this.photos = photos;
    }

    
}
