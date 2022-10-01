package com.greatlearning.customerRelationshipMgnt.service;

import java.util.List;

import com.greatlearning.customerRelationshipMgnt.entity.Customer;

public interface CustomerService {

	public List<Customer> getAllCustomerDetails();

	public void saveCustomerDetails(Customer CustomerObject);

	public Customer getCustomerDetailsById(int id);

	public void deleteCustomerById(int id);

}
