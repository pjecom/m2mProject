package com.m2m.fo.bd.service;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BdMainServiceImpl implements BdMainService {@Override
	public String getString() {
		return "abc";
	}

}
