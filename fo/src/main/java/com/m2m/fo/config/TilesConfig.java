package com.m2m.fo.config;

import java.net.URL;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
//import org.springframework.web.servlet.view.tiles3.TilesView;
//import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfig implements WebMvcConfigurer{
//
//    @Bean
//    public TilesConfigurer tilesConfigurer() {
//        final TilesConfigurer configurer = new TilesConfigurer();
//        URL url = getClass().getResource("/config/tiles/tiles.xml");
//        if(url != null) {
//        	configurer.setDefinitions(url.toString());
//        }
//        configurer.setCheckRefresh(true);
//        return configurer;
//    }
//
//    @Bean
//    public TilesViewResolver tilesViewResolver() {
//        final TilesViewResolver tilesViewResolver = new TilesViewResolver();
//        tilesViewResolver.setViewClass(TilesView.class);
//        return tilesViewResolver;
//    }
//
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		// TODO Auto-generated method stub
//		registry.addInterceptor(new HttpMethodInterceptor());
//		WebMvcConfigurer.super.addInterceptors(registry);
//	}
//    
//    
    
}