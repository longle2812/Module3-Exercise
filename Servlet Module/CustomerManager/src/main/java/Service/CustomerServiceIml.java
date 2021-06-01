package Service;

import DAO.CustomerDAO;
import DAO.iCustomerDAO;
import Model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceIml implements CustomerService {
    private iCustomerDAO customerDAO = new CustomerDAO();

    @Override
    public List<Customer> findAll() {

        return customerDAO.findAll();
    }

    @Override
    public void save(Customer customer) {
    }

    @Override
    public Customer findById(int id) {
        return customerDAO.findById(id);
    }

    @Override
    public boolean update(int id, Customer customer) {

       return customerDAO.updateCustomerInfo(id, customer);
    }

    @Override
    public boolean remove(int id) {
        return customerDAO.deleteCustomer(id);
    }

    @Override
    public void createNewCustomer(Customer customer) {
        customerDAO.createNewCustomer(customer);
    }

}
