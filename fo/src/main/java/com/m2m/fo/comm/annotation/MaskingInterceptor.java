package com.m2m.fo.comm.annotation;


import java.lang.reflect.Field;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * MaskingInterceptor.java
 * @version
 */
@Slf4j
@Component
@Intercepts({
		@Signature(type = ParameterHandler.class, method = "setParameters", args = {PreparedStatement.class})
        ,@Signature(type = ResultSetHandler.class, method = "handleResultSets", args = {Statement.class})
})
public class MaskingInterceptor implements Interceptor{

 	MaskAnnotationUtil maskingUtil = new MaskAnnotationUtil();

 	/**
	 * 
	 * <pre>
	 * 처리내용: Mybatis에서 xml에 Parameter를 세팅할때와 ResultSet 처리시 인터셉트하여 마스킹처리 대상에 마스킹한다.
	 * </pre>
	 * @param <T>
	 * @param Invocation invocation
	 * @return
	 * @throws Throwable
	 */
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		// TODO Auto-generated method stub
		String invocationMethod = invocation.getMethod().getName();
		//log.debug("intercept:"+invocationMethod);
		if ("handleResultSets".equals(invocationMethod)) {
			//조회후
			Object resultObject = invocation.proceed();
	        if (Objects.isNull(resultObject)) {
	            return null;
	        }
	        // selectList
	        if (resultObject instanceof List) {
	            ArrayList resultList = (ArrayList) resultObject;
	            if (!CollectionUtils.isEmpty(resultList) && needToUnMasking(resultList.get(0))) {
	                for (Object result : resultList) {
	                    //unMasking Each record
	                	maskingUtil.unMaskingField(result);
	                }
	            }
	        // selectOne
	        } else {
	            if (needToUnMasking(resultObject)) {
	            	maskingUtil.unMaskingField(resultObject);
	            }
	        }
			return resultObject;
		}
		else {// if("setParameters".equals(invocationMethod)) {
			//파라미터 세팅
			 ParameterHandler parameterHandler = (ParameterHandler) invocation.getTarget();
		        Field parameterField = parameterHandler.getClass().getDeclaredField("parameterObject");
		        parameterField.setAccessible(true);

		        Object parameterObject = parameterField.get(parameterHandler);
		        if (parameterObject != null) {
		            Class parameterObjectClass = parameterObject.getClass();
		            // 마스킹 클래스 확인
		            MaskingClass maskingData = AnnotationUtils.findAnnotation(parameterObjectClass, MaskingClass.class);
		            if (Objects.nonNull(maskingData)) {
		                Field[] declaredFields = parameterObjectClass.getDeclaredFields();
		                maskingUtil.maskingField(declaredFields, parameterObject);
		            }
		        }
		        return invocation.proceed();
		}
		//return invocation.proceed();
		
	}

	/**
	 * 
	 * <pre>
	 * 처리내용: Object가 마스킹 대상인지 확인한다.
	 * </pre>
	 * @param object
	 * @return
	 */
	private boolean needToUnMasking(Object object) {
        Class objectClass = object.getClass();
        MaskingClass maskingData = AnnotationUtils.findAnnotation(objectClass, MaskingClass.class);
        return Objects.nonNull(maskingData);
    }
	
	@Override
	public Object plugin(Object target) {
		// TODO Auto-generated method stub
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		// TODO Auto-generated method stub
		
	}
	
	

}
