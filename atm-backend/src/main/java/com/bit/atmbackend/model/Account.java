package com.bit.atmbackend.model;
import jakarta.persistence.*;
import java.math.BigDecimal;

//============= STEP 1.2 ===============

@Entity

@Table (name = "accounts")
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int accountId;
	
	private String userId;
	
	@Enumerated(EnumType.STRING)
	private AccountType accountType;

	private BigDecimal balance;

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public AccountType getAccountType() {
		return accountType;
	}

	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public Account() {
		super();
	}

	public Account(int accountId, String userId, AccountType accountType, BigDecimal balance) {
		super();
		this.accountId = accountId;
		this.userId = userId;
		this.accountType = accountType;
		this.balance = balance;
	}
	
	
}
