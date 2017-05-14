package com.aquent.crudapp.domain;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * The client entity corresponding to the "client" table in the database.
 */
public class Client {

	private Integer clientId;

	@NotNull
	@Size(min = 1, max = 50, message = "Company name is required with maximum length of 50")
	private String companyName;

	@NotNull
	@Size(min = 1, max = 50, message = "Website is required with maximum length of 50")
	private String website;

	@NotNull
	@Size(min = 1, max = 50, message = "Valid phone number is required")
	private String phone;

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
	
	private List<Person> contacts;

	public Integer getClientId() {
		return clientId;
	}

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

	/**
	 * Gets the website
	 * @return the website
	 */
	public String getWebsite() {
		return website;
	}

	/**
	 * Sets the website
	 * @param website the website to set
	 */
	public void setWebsite( String website ) {
		this.website = website;
	}

	/**
	 * Gets the phone
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * Sets the phone
	 * @param phone the phone to set
	 */
	public void setPhone( String phone ) {
		this.phone = phone;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress( String streetAddress ) {
		this.streetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity( String city ) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState( String state ) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode( String zipCode ) {
		this.zipCode = zipCode;
	}
	
	public List<Person> getContacts() {
		return contacts;
	}
	
	public void setContact( List<Person> contacts ) {
		this.contacts = contacts;
	}
	
	public void addContact( Person contact ) {
		if( contacts == null ) {
			contacts = new ArrayList<Person>();
		}
		contacts.add( contact );
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Client [clientId=" + clientId + ", companyName=" + companyName + ", website="
				+ website + ", phone=" + phone + ", streetAddress=" + streetAddress + ", city="
				+ city + ", state=" + state + ", zipCode=" + zipCode + ", contacts=" + contacts
				+ "]";
	}
}
