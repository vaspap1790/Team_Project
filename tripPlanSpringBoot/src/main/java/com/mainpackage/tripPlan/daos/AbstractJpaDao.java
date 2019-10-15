
package com.mainpackage.tripPlan.daos;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Transactional
public class AbstractJpaDao <T extends Serializable> implements IGenericDao<T> {

   private Class< T > clazz;
 
   @PersistenceContext
   EntityManager entityManager;
 
   public void setClazz( Class< T > clazzToSet ) {
      this.clazz = clazzToSet;
   }
 
   @Override
   public T findById( long id ){
      return (T) entityManager.find( clazz, id );
   }
   
   @Override
   public List< T > findAll(){
      return entityManager.createQuery( "from " + clazz.getName() )
       .getResultList();
   }
 
   @Override
   public void save( T entity ){
      entityManager.persist( entity );
   }
 
   @Override
   public void update( T entity ){
      entityManager.merge( entity );
   }
 
   @Override
   public void delete( T entity ){
      entityManager.remove( entity );
   }

}
