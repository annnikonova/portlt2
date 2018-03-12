package com.aimprosoft.task5.dao.impl;

import com.aimprosoft.task5.dao.DepartmentDao;
import com.aimprosoft.task5.model.Department;

import com.aimprosoft.task5.model.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpringHibernateDepartmentDaoImpl implements DepartmentDao, HqlStatements {


    private SessionFactory sessionFactory;

    @Override
    @SuppressWarnings("unchecked")
    public Iterable<Department> list() {
        return sessionFactory.getCurrentSession().createQuery(DEPARTMENTS_ALL_HQL).list();
    }

    @Override
    public Department getById(long id)   {
        return sessionFactory.getCurrentSession().get(Department.class, id);
   }

    @Override
    @SuppressWarnings("unchecked")
    public Department getByName(String name)   {
        Query<Department> query = sessionFactory.getCurrentSession()
                .createQuery(DEPARTMENTS_ALL_HQL + NAME_CONDITION);
        query.setParameter("name", name);
        return query.uniqueResult();

    }

    @Override
    public boolean add(Department department)   {
        sessionFactory.getCurrentSession().persist(department);
        return true;
    }

    @Override
    @SuppressWarnings("unchecked")
    public boolean delete(long id) {
        Session session = sessionFactory.getCurrentSession();
        Department department = session.get(Department.class, id);
        Query<Employee> querySelect = session.createQuery(EMPLOYEES_ALL_HQL + DEPARTMENT_CONDITION);
        querySelect.setParameter("department", department.getName());
        if (!querySelect.getResultList().isEmpty()) {
            return false;
        }
        session.delete(department);
        return true;

    }

    @Override
    public boolean update(long id, Department newDepartment)   {
        Session session = sessionFactory.getCurrentSession();
        Department department = session.get(Department.class, id);
        fillDepartent(department, newDepartment);
        session.update(department);
        return true;
    }

    private void fillDepartent(Department department, Department newDepartment) {
        department.setName(newDepartment.getName());
        department.setInfo(newDepartment.getInfo());
    }
}
