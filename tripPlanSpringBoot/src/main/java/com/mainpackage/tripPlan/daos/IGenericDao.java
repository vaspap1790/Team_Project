
package com.mainpackage.tripPlan.daos;

import java.io.Serializable;
import java.util.List;


public interface IGenericDao< T extends Serializable> {

    public T findById(final long id);

    public List<T> findAll();

    public void save(final T entity);
    
    public void update(final T entity);

    public void delete(final T entity);

}