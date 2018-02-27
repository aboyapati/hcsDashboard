/**
 * 
 */
package com.tekvizion.hcs.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.tekvizion.hcs.modal.CarriersType;

/**
 * @author vrkatari
 *
 */
@Repository
public class CarriersTypeRepositoryImpl implements CarriersTypeRepository {

	@PersistenceContext
	EntityManager entityManager;
	
	@Override
	public void add(CarriersType carriersType) {
		this.entityManager.persist(carriersType);
		this.entityManager.flush();
	}

	@Override
	public void edit(CarriersType carriersType) {
		this.entityManager.merge(carriersType);
		this.entityManager.flush();
	}

	@Override
	public CarriersType findById(String id) {
		CarriersType carriersType = (CarriersType) this.entityManager.find(CarriersType.class, id);
		return carriersType;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CarriersType> getAll() {
		Query q = this.entityManager.createQuery("from CarriersType order by name asc");
		return (List<CarriersType>) q.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public CarriersType findByName(String name) {
		Query q = this.entityManager.createQuery("from CarriersType where name =:nme");
		q.setParameter("nme", name);
		List<CarriersType> carriersTypeList = q.getResultList();
		if(carriersTypeList.isEmpty()){
			return null;
		}
		return (CarriersType) carriersTypeList.get(0);
	}

}
