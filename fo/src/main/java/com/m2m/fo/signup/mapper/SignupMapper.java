package com.m2m.fo.signup.mapper;

import com.m2m.fo.signup.model.SignupVO;

public interface SignupMapper {
	
	public String getMaxBidEntrpsNo();
	
	public void insertEntrps(SignupVO signupVO);
	
}
