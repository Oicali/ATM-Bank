package com.bit.atmbackend.model;
import jakarta.persistence.*;

//============= STEP 1.3 ===============

@Entity

@Table (name = "billers")
public class Biller {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // add if auto-increment in DB
	private int billerId;
	
	private String billerName;

	public int getBillerId() {
		return billerId;
	}

	public void setBillerId(int billerId) {
		this.billerId = billerId;
	}

	public String getBillerName() {
		return billerName;
	}

	public void setBillerName(String billerName) {
		this.billerName = billerName;
	}

	public Biller() {
		super();
	}

	public Biller(int billerId, String billerName) {
		super();
		this.billerId = billerId;
		this.billerName = billerName;
	}

	
}
