package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.TransportationType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TranspTypeRepo extends CrudRepository<TransportationType, Integer> {

    @Query("SELECT t FROM TransportationType t WHERE t.type = :type")
    TransportationType findByType(@Param("type") String type);
}
