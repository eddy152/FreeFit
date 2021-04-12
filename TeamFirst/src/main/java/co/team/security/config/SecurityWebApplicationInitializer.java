package co.team.security.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/*
 * 
 * 스프링 시큐리티를 사용하려면 AbstractSecurityWebApplicationInitializer를 상속받는 클래스를 반드시 작성해주셔야 합니다. 
AbstractSecurityWebApplicationInitializer를 상속받는 클래스를 작성해야 스프링 시큐리티 필터들이 활성화된다.
*/
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {
}