package com.m2m.fo.constants;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CommonConstants {
	private CommonConstants() {
		log.debug(CommonConstants.class.getSimpleName());
	}
	
	// 암호화 키
    public static final String CRYPTO_AES_KEY = "sorinscretkeycryptoaeskey";
    public static final String CRYPTO_IV_KEY = "sorinscretkeycry";
    public static final String CRYPTO_AES256_KEY = "sO2#*ri$nSc^rE@tk!$ey&cRyp%toDes";
    public static final String CRYPTO_IV256_KEY = "cJr@#Vcjid7#fk&k";
    public static final String CRYPTO_DES_KEY = "sorinscretkeycryptodeskey";
    public static final String CRYPTO_DESEDS_KEY = "sorinscretkeycryptodesedskey";
}
