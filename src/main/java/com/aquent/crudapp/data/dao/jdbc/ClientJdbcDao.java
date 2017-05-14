package com.aquent.crudapp.data.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aquent.crudapp.data.dao.ClientDao;
import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Person;

/**
 * Spring JDBC implementation of {@link ClientDao}.
 */
public class ClientJdbcDao implements ClientDao {

    private static final String SQL_LIST_CLIENTS = "SELECT * FROM client left join person on (person.client_id = client.client_id ) ORDER BY company_name, client_id";
    private static final String SQL_READ_CLIENT = "SELECT * FROM client left join person on (person.client_id = client.client_id ) WHERE client_id = :clientId";
    private static final String SQL_DELETE_CLIENT = "DELETE FROM client WHERE client_id = :clientId";
    private static final String SQL_UPDATE_CLIENT = "UPDATE client SET (company_name, website, phone, street_address, city, state, zip_code)"
                                                  + " = (:companyName, :website, :phone, :streetAddress, :city, :state, :zipCode)"
                                                  + " WHERE client_id = :clientId";
    private static final String SQL_CREATE_CLIENT = "INSERT INTO client (company_name, website, phone, street_address, city, state, zip_code)"
                                                  + " VALUES (:companyName, :website, :phone, :streetAddress, :city, :state, :zipCode)";

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Client> listClients() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_CLIENTS, new ClientResultsExtractor());
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Client readClient(Integer clientId) {
    	Client client = null;
    	try {
    		 client = namedParameterJdbcTemplate.getJdbcOperations().query(SQL_READ_CLIENT, new Object[]{clientId}, new ClientResultsExtractor()).get( 0 );
    		 return client;
    	} catch (EmptyResultDataAccessException e) {
    		return null;
    	} catch (IndexOutOfBoundsException e) {
    		return null;
    	}
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deleteClient(Integer clientId) {
        namedParameterJdbcTemplate.update(SQL_DELETE_CLIENT, Collections.singletonMap("clientId", clientId));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updateClient(Client client) {
        namedParameterJdbcTemplate.update(SQL_UPDATE_CLIENT, new BeanPropertySqlParameterSource(client));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createClient(Client client) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_CLIENT, new BeanPropertySqlParameterSource(client), keyHolder);
        return keyHolder.getKey().intValue();
    }

    /**
     *Results Extractor for client records.
     */
    private static final class ClientResultsExtractor implements ResultSetExtractor<List<Client>> {

        @Override
        public List<Client> extractData(ResultSet rs) throws SQLException {
        	
        	// The clientMap is used to add multiple persons to a single client object
        	Map<Integer, Client> clientMap = new HashMap<Integer, Client>();
        	
        	Client client;
        	while( rs.next() ) {
        		Integer clientId = rs.getInt( "client_id" );
        		
        		// If the client already exists in the map we don't need to process client values again
        		// We will be adding a new person to the client
        		client = clientMap.get( clientId );
        		
        		// We have not already processed this client. Get the client values
        		if( client == null ) {
        			client = new Client();
                    client.setClientId(rs.getInt("client_id"));
                    client.setCompanyName(rs.getString("company_name"));
                    client.setWebsite(rs.getString("website"));
                    client.setPhone(rs.getString("phone"));
                    client.setStreetAddress(rs.getString("client.street_address"));
                    client.setCity(rs.getString("client.city"));
                    client.setState(rs.getString("client.state"));
                    client.setZipCode(rs.getString("client.zip_code"));
        		}
        		
                // Add a person to the client if a person was returned in this row
                Integer personId = rs.getInt( "person_id" );
                if( personId > 0 ) {
	                Person person = new Person();
	                person.setPersonId(personId);
	                person.setFirstName(rs.getString("first_name"));
	                person.setLastName(rs.getString("last_name"));
	                person.setEmailAddress(rs.getString("email_address"));
	                person.setStreetAddress(rs.getString("person.street_address"));
	                person.setCity(rs.getString("person.city"));
	                person.setState(rs.getString("person.state"));
	                person.setZipCode(rs.getString("person.zip_code"));
	                client.addContact( person );
                }
                
                // Add the updated client to the clientMap
                clientMap.put( clientId, client );
        	}
        	
            return new ArrayList<Client>(clientMap.values());
        }
    }
}
