
package com.mainpackage.tripPlan.dto;

import com.mainpackage.tripPlan.model.Comment;
import com.mainpackage.tripPlan.model.File;
import com.mainpackage.tripPlan.model.Photo;
import java.util.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostDTO {
    
    int tripId;
    int postId;
    byte[] profilePhoto;
    String username;
    String title;
    String body;
    Date timeStamp;
//    Integer likes;
//    List<Photo> photos;
//    List<Comment> comments;

    public PostDTO(int tripId,int postId,byte[] profilePhoto, String username, String title, String body, Date timeStamp) {
        this.tripId=tripId;
        this.postId=postId;
        this.profilePhoto = profilePhoto;
        this.username = username;
        this.title = title;
        this.body = body;
        this.timeStamp = timeStamp;
//        this.likes = likes;
//        this.photos = photos;
//        this.comments = comments;
    }
    
    
}
