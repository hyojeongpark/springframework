package com.myproject.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccountDTO {
	private String id;
	private String pass;
	private String name;
	private String email;
	private Date regdate;
}
