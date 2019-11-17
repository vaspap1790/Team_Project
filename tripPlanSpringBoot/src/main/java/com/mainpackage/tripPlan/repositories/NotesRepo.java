package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.dto.NotesDTO;
import com.mainpackage.tripPlan.model.Notes;
import java.util.Date;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.List;


public interface NotesRepo extends CrudRepository<Notes, Integer> {
    
       @Query("select new com.mainpackage.tripPlan.dto.NotesDTO("
            + "n.id,n.title,n.body,n.date)  "
            + " from Notes n inner join n.tripId tr  "
            + " where  tr.tripId= :tripId")
    List<NotesDTO> findNotesByTripId(@Param("tripId") Integer tripId);

    @Query("select new com.mainpackage.tripPlan.dto.NotesDTO("
            + "n.id,n.title,n.body,n.date)  "
            + " from Notes n inner join n.tripId tr  "
            + " where  tr.tripId= :tripId and n.date=:date")
    List<NotesDTO> findNotesByTripIdAndDate(@Param("tripId") Integer tripId,
                                      @Param("date") Date date);
}
