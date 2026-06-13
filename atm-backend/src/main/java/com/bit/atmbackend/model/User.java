package com.bit.atmbackend.model;
import jakarta.persistence.*;

// ============= STEP 1.1 ===============

@Entity

@Table (name = "users")
public class User {
	@Id
	private String userId;
	private String username;
	private String pin;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	
	
	public User() {
		super();
	}
	
	public User(String userId, String username, String pin) {
		super();
		this.userId = userId;
		this.username = username;
		this.pin = pin;
	}
}
