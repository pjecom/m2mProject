package com.m2m.bo.login.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class Account implements UserDetails {
	/* 직원 ID */
	private String id;
	/* 직원 번호 */
	private String emplNo;
	/* 직원 PASSWORD */
	private String password;
	/* 직원 이름 */
	private String name;
	/* 직원 직위명 */
	private String ofcps;
	/* 직원 부서명 */
	private String deptNm;
	/* 직원 휴대폰 번호 */
	private String mobileNo;
	/* 직원 회사 전화번호 */
	private String telNo;
	/* 직원 회사 E-Mail */
	private String email;
	/* 직원 권한 번호*/
	private String authorNo;
	/* 직원 ROLE */
	private String role;
	/* 최근 로그인 일시 */
	private String recentLoginDt;
	
	/* ROLE을 사용하는 경우 
	private List<String> roles = new ArrayList<>();
	*/
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
		/* ROLE을 사용하는 경우
		return this.roles.stream()
				.map(SimpleGrantedAuthority::new)
				.collect(Collectors.toList());
		*/
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.password;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.name;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}