package com.myproject.mapper;


import java.util.List;
import com.myproject.dto.ShopDTO;

public interface ShopMapper {
	public void insert (ShopDTO shop); 

	public List<ShopDTO> getList(); 
}
