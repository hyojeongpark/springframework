package com.myproject.model;


import java.util.List;
import com.myproject.dto.ShopDTO;

public interface ShopService {
	public void insert(ShopDTO shop);
	public List<ShopDTO> getList();
}
