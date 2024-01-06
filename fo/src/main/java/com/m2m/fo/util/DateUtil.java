package com.m2m.fo.util;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class DateUtil {
	
	private DateUtil() {
		log.debug(DateUtil.class.getSimpleName());
	}
	
	public static String getFormatCurrentTime(long time, String format) {
	    try {
	        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
	        return simpleDateFormat.format(time);
        } catch (NullPointerException e) {
            throw new NullPointerException("입력값이 없는 오류");
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("입력값 형식 오류");
        }
	}

}
