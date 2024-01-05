package com.m2m.fo.comm.annotation;

import java.lang.reflect.Field;
import java.util.Objects;

import org.springframework.stereotype.Component;

import com.m2m.fo.util.CryptoUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MaskAnnotationUtil {

	/**
	 * 
	 * <pre>
	 * 처리내용: 인터셉터를 통해 마스킹대상 필드를 전달 받아 마스킹 필드 타입에 따라 마스킹한다. 
	 * </pre>
	 * @param <T>
	 * @param declaredFields
	 * @param paramsObject
	 * @return
	 * @throws IllegalAccessException
	 */
	//@SuppressWarnings("unchecked")
	public  <T>T maskingField(Field[] declaredFields, T paramsObject) throws IllegalAccessException {
        for (Field field : declaredFields) {
        	MaskingField maskField = field.getAnnotation(MaskingField.class);
            if (!Objects.isNull(maskField)) {
                field.setAccessible(true);
                Object object = field.get(paramsObject);
                if (object instanceof String) {
                    String value = (String) object;
                    switch (field.getAnnotation(MaskingField.class).value()) {
        			case ENCRYPT:
//        				log.debug("maskingField Encrypt");
//        				log.debug("maskingField Encrypt : "+value);
        				//paramsObject = (T) CryptoUtil.encryptSHA256(value);
                        field.set(paramsObject, CryptoUtil.encryptSHA256(value));
        				break;
        			case EMAIL:
//         				log.debug("maskingField EMail");
//         				log.debug("maskingField EMail : "+value);
         				break;	
         			default:
//         				log.debug("maskingField default");
//         				log.debug("maskingField default : "+value);
         			//	field.set(paramsObject, value+"111");
         				break;
        			}
                    
                }
            }
        }
        return paramsObject;
    }
	
	/**
	 * 
	 * <pre>
	 * 처리내용: 인터셉터를 통해 마스킹대상 필드를 전달 받아 마스킹 필드 타입에 따라 마스킹을 해제한다. 
	 * </pre>
	 * @param <T>
	 * @param paramsObject
	 * @return
	 * @throws IllegalAccessException
	 */
	public <T>T unMaskingField(T paramsObject) throws IllegalAccessException {
        // Take out resultType Class 
        Class resultClass = paramsObject.getClass();
        Field[] declaredFields = resultClass.getDeclaredFields();
        for (Field field : declaredFields) {
            // Take out all of them EncryptDecryptField Annotated fields 
        	MaskingField maskField = field.getAnnotation(MaskingField.class);
            if (!Objects.isNull(maskField)) {
                field.setAccessible(true);
                 Object object = field.get(paramsObject);
                // Only support String The disclosure of the 
                if (object instanceof String) {
//                	 String value = (String) object;
                     switch (field.getAnnotation(MaskingField.class).value()) {
         			case ENCRYPT:
         				log.debug("unMaskingField Encrypt");
//         				log.debug("unMaskingField Encrypt : "+value);
         				break;
         			case EMAIL:
         				log.debug("unMaskingField EMail");
//         				log.debug("unMaskingField EMail : "+value);
         				break;	
         			default:
         				log.debug("unMaskingField default");
//         				log.debug("unMaskingField default : "+value);
//         				field.set(paramsObject, value+"222");
         				break;
         			}
                }
                
            }
        }
        return paramsObject;
    }
	
}
