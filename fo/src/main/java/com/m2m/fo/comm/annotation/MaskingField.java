package com.m2m.fo.comm.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface MaskingField {
	public MaskingType value() default MaskingType.NONE;
	
	enum MaskingType{
		ENCRYPT,
		EMAIL,
		NONE;
	}
	
}
