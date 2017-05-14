package com.aquent.crudapp.data.dao.jdbc;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import com.aquent.crudapp.domain.Person;

/**
 * A Class to test SQL statements
 * 
 * @author Chris Bentley
 *
 */
public class PersonJdbcDaoTest {
    private EmbeddedDatabase db;
    
    @Before
    public void setUp() {
        // creates a HSQL in-memory db populated from classpath:schema.sql and classpath:test-data.sql
    	EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
    	builder.setType(EmbeddedDatabaseType.HSQL)
			.addScript("classpath:schema.sql")
			.addScript("classpath:data.sql");
        db = builder.build();
    }
	
    @Test
    public void testDataAccess() {
        NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(db);
        PersonJdbcDao dao = new PersonJdbcDao();
        dao.setNamedParameterJdbcTemplate( template );
        List<Person> people = dao.listUnAssociated( 1 );
        System.out.println( people );
        
        System.out.println( dao.listPeople() );
    }
	
    @After
    public void tearDown() {
        db.shutdown();
    }

}
