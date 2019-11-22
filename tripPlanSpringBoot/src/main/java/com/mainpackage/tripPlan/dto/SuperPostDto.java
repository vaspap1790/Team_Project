/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.dto;

import com.mainpackage.tripPlan.model.Comment;
import com.mainpackage.tripPlan.model.Likes;
import com.mainpackage.tripPlan.model.Photo;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.*;


@Getter
@Setter
@NoArgsConstructor
public class SuperPostDto {
    
    int tripId;
    int postId;
    String username;
    String title;
    String body;
    Date timeStamp;
    String profilePhoto;
    List<PostPhotosDto> photos;
    List<PostCommentsDto> comments;
    List<PostLikesDTO> likes;

    public SuperPostDto(int tripId,int postId, String username, String title, String body, Date timeStamp,String profilePhoto) {
        this.postId = postId;
        this.username = username;
        this.title = title;
        this.body = body;
        this.timeStamp = timeStamp;
        this.profilePhoto = profilePhoto;
        
    }

    public SuperPostDto(int tripId, int postId, String username, String title, String body, Date timeStamp) {
        this.tripId = tripId;
        this.postId = postId;
        this.username = username;
        this.title = title;
        this.body = body;
        this.timeStamp = timeStamp;
    }

    @Override
    public String toString() {
        return "SuperPostDto{" + "tripId=" + tripId + ", postId=" + postId + ", body=" + body + ", timeStamp=" + timeStamp + ", profilePhoto=" + profilePhoto + ", photos=" + photos + ", comments=" + comments + ", likes=" + likes + '}';
    }


    
    
}
