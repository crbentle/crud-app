package com.aquent.crudapp.data.dao;

import java.util.List;

import com.aquent.crudapp.domain.Person;

/**
 * Operations on the "person" table.
 */
public interface PersonDao {

    /**
     * Retrieves all of the person records.
     *
     * @return list of person records
     */
    List<Person> listPeople();
    
    List<Person> listUnAssociated(Integer clientId);

    /**
     * Creates a new person record.
     *
     * @param person the values to save
     * @return the new person ID
     */
    Integer createPerson(Person person);

    /**
     * Retrieves a person record by ID.
     *
     * @param id the person ID
     * @return the person record
     */
    Person readPerson(Integer id);

    /**
     * Updates an existing person record.
     *
     * @param person the new values to save
     */
    void updatePerson(Person person);

    /**
     * Deletes a person record by ID.
     *
     * @param id the person ID
     */
    void deletePerson(Integer id);
    
    /**
     * Adds an association between the person and client.
     * 
     * @param personId the person ID
     * @param clientId the client ID
     */
    void addAssociation(Integer personId, Integer clientId);
    
    /**
     * Deletes an association between the person and client.
     * 
     * @param personId the person ID
     * @param clientId the client ID
     */
    void deleteAssociation(Integer personId, Integer clientId);
}
