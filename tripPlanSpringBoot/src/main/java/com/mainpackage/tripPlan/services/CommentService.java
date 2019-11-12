/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Comment;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CommentService {
    
    @Autowired
    GenericJpaDao<Comment> commentDao;
    
    
    public void saveComment(Comment comment) {
         commentDao.save(comment);
    }
}
