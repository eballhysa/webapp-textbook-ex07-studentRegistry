/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package al.edu.unyt.advjava.webapps.utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author elton.ballhysa
 */
public class Utilities {

    public static EntityManager entityManager() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("StudentRegistry-workingPU");
        return emf.createEntityManager();
    }
    
    public static double creditPoints(String letterGrade) {
        if ("A".equals(letterGrade))
            return 4.00;
        if ("A-".equals(letterGrade))
            return 3.67;
        if ("B+".equals(letterGrade))
            return 3.33;
        if ("B".equals(letterGrade))
            return 3.00;
        if ("B-".equals(letterGrade))
            return 2.67;
        if ("C+".equals(letterGrade))
            return 2.33;
        if ("C".equals(letterGrade))
            return 2.00;
        if ("C-".equals(letterGrade))
            return 1.67;
        if ("D+".equals(letterGrade))
            return 1.33;
        if ("D".equals(letterGrade))
            return 1.00;
        if ("D-".equals(letterGrade))
            return 0.67;
        
        return 0.0;
    }
}
