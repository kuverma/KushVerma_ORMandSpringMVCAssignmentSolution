package com.greatlearning.customerRelationshipMgnt.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greatlearning.customerRelationshipMgnt.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private SessionFactory sessionFactory;

	// create session
	private Session session;

	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
	}

	@Override
	@Transactional
	public List<Customer> getAllCustomerDetails() {
		Transaction tx = session.beginTransaction();
		List<Customer> customers = session.createQuery("from Customer").list();
		tx.commit();
		return customers;
	}

	@Override
	@Transactional
	public void saveCustomerDetails(Customer CustomerObject) {
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(CustomerObject);
		tx.commit();
	}

	@Override
	@Transactional
	public Customer getCustomerDetailsById(int id) {
		Transaction tx = session.beginTransaction();
		Customer customer = (Customer) session.get(Customer.class, id);
		tx.commit();
		return customer;
	}

	@Override
	@Transactional
	public void deleteCustomerById(int id) {
		Transaction tx = session.beginTransaction();
		session.delete(session.get(Customer.class, id));
		tx.commit();
	}

}
