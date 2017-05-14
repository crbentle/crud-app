package com.aquent.crudapp.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * The person entity corresponding to the "person" table in the database.
 */
public class Person {

    private Integer personId;

    @NotNull
    @Size(min = 1, max = 50, message = "First name is required with maximum length of 50")
    private String firstName;

    @NotNull
    @Size(min = 1, max = 50, message = "Last name is required with maximum length of 50")
    private String lastName;

    @NotNull
    @Size(min = 1, max = 50, message = "Email address is required with maximum length of 50")
    private String emailAddress;

    @NotNull
    @Size(min = 1, max = 50, message = "Street address is required with maximum length of 50")
    private String streetAddress;

    @NotNull
    @Size(min = 1, max = 50, message = "City is required with maximum length of 50")
    private String city;

    @NotNull
    @Size(min = 2, max = 2, message = "State is required with length 2")
    private String state;

    @NotNull
    @Size(min = 5, max = 5, message = "Zip code is required with length 5")
    private String zipCode;
    
    private Integer clientId;
    private String companyName;

    public Integer getPersonId() {
        return personId;
    }

    public void setPersonId(Integer personId) {
        this.personId = personId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

	/**
	 * Gets the clientId
	 * @return the clientId
	 */
	public Integer getClientId() {
		return clientId;
	}

	/**
	 * Sets the clientId
	 * @param clientId the clientId to set
	 */
	public void setClientId( Integer clientId ) {
		this.clientId = clientId;
	}

	/**
	 * Gets the companyName
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * Sets the companyName
	 * @param companyName the companyName to set
	 */
	public void setCompanyName( String companyName ) {
		this.companyName = companyName;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Person [personId=" + personId + ", firstName=" + firstName + ", lastName="
				+ lastName + ", emailAddress=" + emailAddress + ", streetAddress=" + streetAddress
				+ ", city=" + city + ", state=" + state + ", zipCode=" + zipCode + ", clientId="
				+ clientId + ", companyName=" + companyName + "]";
	}
}
