package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface UserRepo extends CrudRepository<User, Integer> {

    @Query("SELECT u FROM User u WHERE u.username = :username")
    User findByUsername(@Param("username") String username);

    @Query("SELECT u FROM User u WHERE u.userId = :userId")
    User findByUserId(@Param("userId") Integer userId);

    User findByEmail(String email);

    @Query("SELECT u FROM User u")
    List<User> findAllUsers();
}
