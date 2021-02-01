/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package al.edu.unyt.advjava.webapps.beans;

import al.edu.unyt.advjava.webapps.model.Student;
import al.edu.unyt.advjava.webapps.model.StudentCourse;
import al.edu.unyt.advjava.webapps.utils.Utilities;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

/**
 *
 * @author elton.ballhysa
 */
@ManagedBean
@SessionScoped
public class LoginBean {
    
    private String email;
    private String password;
    private Student loggedStudent;
    
    public int getTotalCredits() {
        if (loggedStudent != null) {
            return loggedStudent
                    .getStudentCoursesList()
                    .stream()
                    .map(sc -> sc.getCourse())
                    .mapToInt(c -> c.getCredits())
                    .sum();
        }
        return 0;
    }
    
    public double getGPA() {
        if (loggedStudent != null) {
            double totalPoints = loggedStudent.getStudentCoursesList()
                    .stream()
                    .mapToDouble(this::earnedPoints)
                    .sum();
            return totalPoints / getTotalCredits();
        }
        return 0.0;
    }
    
    private double earnedPoints(StudentCourse sc) {
        double points_of_grade = Utilities.creditPoints(sc.getLetterGrade()); 
        int credits = sc.getCourse().getCredits();
        return credits * points_of_grade;
    }    
    
    public String doLogin() {
        EntityManager em = Utilities.entityManager();
        List<Student> results = em.createNamedQuery("Student.findByEmailAddress").setParameter("emailAddress", this.email).getResultList();
        if (results.isEmpty()) {
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage("", new FacesMessage("Invalid Email, please try again!"));
            return "login";
        }
        Student student = results.get(0);
        if ( ! this.password.equals(student.getPassword()) ) {
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage("", new FacesMessage("Invalid Password, please try again!"));
            return "login";
        }
        loggedStudent = student;
        return "courses";
        /*
        try {
            loggedStudent = em.createNamedQuery("Student.findByLogin", Student.class)
                    .setParameter("email", this.email)
                    .setParameter("password", this.password)
                    .getSingleResult();
            return "courses";
        } catch (NoResultException e) {
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage("", new FacesMessage("Invalid Credentials, please try again!"));
            e.printStackTrace();
            return "login";
        }
        */
    }
    
    public String doLogout() {
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage("", new FacesMessage("You have successfully logged out!"));
        context.getExternalContext().invalidateSession();
        return "login";
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Student getLoggedStudent() {
        return loggedStudent;
    }
    
    
    
}
