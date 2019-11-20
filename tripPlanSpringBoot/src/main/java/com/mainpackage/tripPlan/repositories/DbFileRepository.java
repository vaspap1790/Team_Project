
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.File;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


public interface DbFileRepository extends CrudRepository<File, Long>{
    
    @Query(value = "SELECT * FROM file f ", nativeQuery = true)
    public List<File> showAllImages(long userId);
}
