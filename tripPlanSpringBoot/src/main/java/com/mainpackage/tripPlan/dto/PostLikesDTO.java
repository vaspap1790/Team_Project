/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.dto;


import com.mainpackage.tripPlan.model.Likes;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PostLikesDTO {
    
    int postId;
    int likes;
 

    public PostLikesDTO(int postId,int likes) {
        this.likes = likes;
        this.postId=postId;
    }
    
}
