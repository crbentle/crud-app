package com.aquent.crudapp.data.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aquent.crudapp.data.dao.PersonDao;
import com.aquent.crudapp.domain.Person;

/**
 * Spring JDBC implementation of {@link PersonDao}.
 */
public class PersonJdbcDao implements PersonDao {

    private static final String SQL_LIST_PEOPLE = "SELECT * FROM person left join client on (client.client_id = person.client_id) ORDER BY first_name, last_name, person_id";
    private static final String SQL_LIST_UNASSOCIATED = "SELECT * FROM person left join client on (client.client_id = person.client_id) WHERE client_id != :clientId";
    private static final String SQL_READ_PERSON = "SELECT * FROM person left join client on (client.client_id = person.client_id) WHERE person_id = :personId";
    private static final String SQL_DELETE_PERSON = "DELETE FROM person WHERE person_id = :personId";
    private static final String SQL_UPDATE_PERSON = "UPDATE person SET (first_name, last_name, email_address, street_address, city, state, zip_code, client_id)"
                                                  + " = (:firstName, :lastName, :emailAddress, :streetAddress, :city, :state, :zipCode, :clientId)"
                                                  + " WHERE person_id = :personId";
    private static final String SQL_CREATE_PERSON = "INSERT INTO person (first_name, last_name, email_address, street_address, city, state, zip_code, client_id)"
                                                  + " VALUES (:firstName, :lastName, :emailAddress, :streetAddress, :city, :state, :zipCode, :clientId)";
    private static final String SQL_ADD_ASSOCIATION = "UPDATE person SET (client_id) = (:clientId) WHERE person_id = :personId";
    private static final String SQL_DELETE_ASSOCIATION = "UPDATE person SET (client_id) = (0) WHERE person_id = :personId";
    

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listPeople() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_PEOPLE, new PersonRowMapper());
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listUnAssociated(Integer clientId) {
    	List<Person> unassociated = namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_UNASSOCIATED, new Object[]{clientId}, new int[]{java.sql.Types.INTEGER}, new PersonRowMapper());
    	return unassociated;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Person readPerson(Integer personId) {
    	Person person = null;
    	try {
    		 person = namedParameterJdbcTemplate.queryForObject(SQL_READ_PERSON, Collections.singletonMap("personId", personId), new PersonRowMapper());
    		 return person;
    	} catch (EmptyResultDataAccessException e) {
    		return null;
    	}
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deletePerson(Integer personId) {
        namedParameterJdbcTemplate.update(SQL_DELETE_PERSON, Collections.singletonMap("personId", personId));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updatePerson(Person person) {
        namedParameterJdbcTemplate.update(SQL_UPDATE_PERSON, new BeanPropertySqlParameterSource(person));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createPerson(Person person) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_PERSON, new BeanPropertySqlParameterSource(person), keyHolder);
        return keyHolder.getKey().intValue();
    }

	/* (non-Javadoc)
	 * @see com.aquent.crudapp.data.dao.PersonDao#addAssociation(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void addAssociation( Integer personId, Integer clientId ) {
		namedParameterJdbcTemplate.update(SQL_ADD_ASSOCIATION, new MapSqlParameterSource().addValue("personId", personId).addValue( "clientId", clientId )  );
	}

	/* (non-Javadoc)
	 * @see com.aquent.crudapp.data.dao.PersonDao#deleteAssociation(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void deleteAssociation( Integer personId, Integer clientId ) {
		namedParameterJdbcTemplate.update(SQL_DELETE_ASSOCIATION, Collections.singletonMap("personId", personId)  );
	}

    /**
     * Row mapper for person records.
     */
    private static final class PersonRowMapper implements RowMapper<Person> {

        @Override
        public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
            Person person = new Person();
            person.setPersonId(rs.getInt("person_id"));
            person.setFirstName(rs.getString("first_name"));
            person.setLastName(rs.getString("last_name"));
            person.setEmailAddress(rs.getString("email_address"));
            person.setStreetAddress(rs.getString("person.street_address"));
            person.setCity(rs.getString("person.city"));
            person.setState(rs.getString("person.state"));
            person.setZipCode(rs.getString("person.zip_code"));
            

			int clientId = rs.getInt( "client_id" );
			if( clientId > 0 ) {
				person.setClientId( clientId );
				person.setCompanyName( rs.getString("company_name") );
			}
            
            return person;
        }
    }
}
