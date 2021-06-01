package DAO;

import Model.Customer;

import java.util.List;

public interface iCustomerDAO {
    List<Customer> findAll();

    Customer findById(int id);

    boolean createNewCustomer(Customer customer);

    boolean updateCustomerInfo(int id, Customer customer);

    boolean deleteCustomer(int id);

}
