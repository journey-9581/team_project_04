package com.team04.spring.pay.dto;

public class PayDto {
	private String amount;
	private String buyer_name;
	private String buyer_email;
	
	public PayDto() {
		
	}

	public PayDto(String amount, String buyer_name, String buyer_email) {
		super();
		this.amount = amount;
		this.buyer_name = buyer_name;
		this.buyer_email = buyer_email;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	
}
