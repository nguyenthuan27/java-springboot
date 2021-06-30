package com.assignment.Service;

import java.util.Collection;

import com.assignment.Entity.ItemCart;

public interface ShoppingCartService { 
	public void add(ItemCart item);
	public void remove(int id);
	double getAmount();
	int getCount();
	Collection<ItemCart> getAllItems();
	void clear();
	ItemCart update(int proId,int qty);
}
