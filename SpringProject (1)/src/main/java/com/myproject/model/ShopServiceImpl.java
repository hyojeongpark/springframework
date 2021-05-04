package com.myproject.model;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myproject.dto.ShopDTO;
import com.myproject.mapper.ShopMapper;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ShopMapper smapper;

	@Override
	public void insert(ShopDTO shop) {
		// TODO Auto-generated method stub
		smapper.insert(shop);
	}

	@Override
	public List<ShopDTO> getList() {
		return smapper.getList();
	}

}
