package com.aimprosoft.task5.service.impl;

import com.aimprosoft.task5.dao.EmployeeDao;
import com.aimprosoft.task5.model.Employee;
import com.aimprosoft.task5.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    public boolean addEmployee(Employee employee) {
        return employeeDao.add(employee);
    }

    public Iterable<Employee> listEmployees(String department) {
        return employeeDao.list(department);
    }


    public boolean deleteEmployee(long id) {
        return employeeDao.delete(id);
    }


    public boolean editEmployee(long id, Employee employee) {
        return employeeDao.update(id, employee);
    }


    public Employee getById(long id) {
        return employeeDao.getById(id);
    }


    public Employee getByEmail(String email) {
        return employeeDao.getByEmail(email);
    }


    public boolean isEmailUnique(long id, String email) {
        Employee existing = getByEmail(email);
        return existing == null || existing.getId() == id;
    }

}
