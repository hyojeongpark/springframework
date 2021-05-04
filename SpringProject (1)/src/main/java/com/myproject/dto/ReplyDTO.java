package com.myproject.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class ReplyDTO {
	private int rnum;
	private String userid;
	private String content;
	@JsonFormat(shape=Shape.STRING,   //shape= JsonFormat.Shape.STRING
			pattern = "yyyy-MM-dd" ,timezone ="Asia/Seoul" )
 private Date regdate;
	private int bnum;
}
