
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.Admin;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepo extends CrudRepository<Admin, Integer> {

    @Query("SELECT a FROM Admin a WHERE a.adminName = :adminName")
    Admin findByAdminName(@Param("adminName") String adminName);

}
