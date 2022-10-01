package com.greatlearning.customerRelationshipMgnt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.customerRelationshipMgnt.entity.Customer;
import com.greatlearning.customerRelationshipMgnt.service.CustomerService;

@Controller
@RequestMapping("/Customerrmgnt")
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/list")
	public String listCustomers(Model model) {
		List<Customer> customers = customerService.getAllCustomerDetails();
		model.addAttribute("customers", customers);
		return "list-customers";
	}

	@RequestMapping("/addnewCustomer")
	public String addCustomer(Model model) {
		Customer customer = new Customer();
		model.addAttribute("customer", customer);
		model.addAttribute("action", "add");
		return "customer-form";
	}

	@PostMapping("/saveCustomerDetails")
	public String saveCustomerDetails(@RequestParam("customerID") int customerID,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("email") String email, @RequestParam("action") String action) {
		Customer customer = null;
		if (action.equalsIgnoreCase("update")) {
			customer = customerService.getCustomerDetailsById(customerID);
			// if (!firstName.equalsIgnoreCase(""))
			customer.setFirstName(firstName);
			// if (!lastName.equalsIgnoreCase(""))
			customer.setLastName(lastName);
			// if (!email.equalsIgnoreCase(""))
			customer.setEmail(email);
			customerService.saveCustomerDetails(customer);
		}
		if (action.equalsIgnoreCase("add")) {
			customer = new Customer(customerID, firstName, lastName, email);
			customerService.saveCustomerDetails(customer);
		}
		return "redirect:/Customerrmgnt/list";

	}

	@RequestMapping("/updateCustomer")
	public String updateCustomerById(@RequestParam("customerID") int customerID, Model model) {
		Customer customerDetails = customerService.getCustomerDetailsById(customerID);
		model.addAttribute("customerDetails", customerDetails);
		model.addAttribute("action", "update");
		model.addAttribute("customerID", customerID);
		return "customer-form";
	}

	@RequestMapping("/deleteCustomer")
	public String deleteCustomerById(@RequestParam("customerID") int customerID) {
		customerService.deleteCustomerById(customerID);
		return "redirect:/Customerrmgnt/list";
	}

}
