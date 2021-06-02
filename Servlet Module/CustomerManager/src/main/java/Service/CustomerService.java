package Service;

import Model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();

    void createNewCustomer(Customer customer);

    void save(Customer customer);

    Customer findById(int id);

    boolean update(int id, Customer customer);

    boolean remove(int id);

    List<Customer> findByAddress(String address);

    List<Customer> sortByName();
}
