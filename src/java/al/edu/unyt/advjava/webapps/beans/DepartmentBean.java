/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package al.edu.unyt.advjava.webapps.beans;

import javax.faces.bean.RequestScoped;
import al.edu.unyt.advjava.webapps.model.Department;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author elton.ballhysa
 */

@ManagedBean(name = "deptBean")
@RequestScoped
public class DepartmentBean {    
    
    public List<Department> getDepartments() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("StudentRegistry-workingPU");
        EntityManager em = emf.createEntityManager();
        return em.createNamedQuery("Department.findAll", Department.class).getResultList();
    }
}
