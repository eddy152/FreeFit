package co.team.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import co.team.security.service.security.CustomUserDetailsService;

//스프링 시큐리티를 이용해 로그인/로그아웃/인증/인가 등을 처리하기 위한 설정 파일입니다.

@Configuration

@EnableWebSecurity
//@EnableWebSecurity가 붙어 있을 경우 스프링 시큐리티를 구성하는 기본적인 빈(Bean)들을 자동으로 구성해줍니다.

public class SecurityConfig extends WebSecurityConfigurerAdapter {
//WebSecurityConfigurerAdapter를 상속받으면, 특정 메소드를 오버라이딩 함으로써 좀 더 손쉽게 설정할 수 있습니다.

	@Autowired
	CustomUserDetailsService customUserDetailsService;

	// <As-Is>
	// public void configure(WebSecurity web) 메소드를 오버라이딩 하는 이유는
	// 인증/인가가 필요 없는 경로를 설정할 필요가 있을 때 오버라이딩을 합니다.

	// /webjars/** 경로에 대한 요청은 인증/인가 처리하지 않도록 무시합니다.
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/webjars/**");
	}
	// <To-Be>
	// public void configure(WebSecurity web) 메소드를 오버라이딩 하는 이유는
	// 인증/인가가 필요 없는 경로를 설정할 필요가 있기 때문입니다.

	// 해당 메소드는 스프링 시큐리티 설정이 자동으로 호출이 되는데, 이때 WebSecurity객체를 파라미터로 넣어주게 됩니다.

	// 해당객체의 ignoring()메소드에 무시될 경로를 지정하면 됩니다. 여기에서는 "/webjars/**"를 설정하였습니다.
	// 자바 개발 도구 중에 ant라는 도구가 있습니다. Maven처럼 프로젝트를 빌드할 때 사용하는 도구인데요. Maven이전에 널리 사용되던
	// 도구였습니다.
	// 이 ant에서 사용하는 표기법 중에 "/경로/**" 와 같은 형식이 있는데요. "**"는 특정 경로 이하의 모든 것을 의미합니다.
	// 즉. "/webjars/"로 시작하는 모든 경로를 무시하라는 의미입니다.

	// protected void configure(HttpSecurity http) 메소드를 오버라이딩 한다는 것은 인증/인가에 대한 설정을
	// 한다는 의미입니다.
	// 가장 중요한 메소드라고 말할 수 있습니다.

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService);
	}
//    WebSecurityConfigurerAdapter가 가지고 있는 void configure(AuthenticationManagerBuilder auth)를 오버라이딩 하고 있습니다. 
//    해당 메소드를 오버라이딩 한 후 UserDetailsService인터페이스를 구현하고 있는 객체를 auth.userDetailsService()메소드의 인자로 전달하고 있습니다.
//
//
//    AuthenticationFilter가 아이디/암호를 입력해서 로그인 할 때 처리해주는 필터이고 
//    아이디에 해당하는 정보를 데이터베이스에서 읽어 들일 때 UserDetailsService를 구현하고 있는 객체를 이용
//    UserDetailsService는 인터페이스이고 해당 인터페이스를 구현하고 있는 빈을 사용.
//    
//    @Autowired 된 CustomUserDetailsService객체를 auth.userDetailsService(customUserDetailsService)로 설정하고 있습니다. 
//    이렇게 설정된 객체는 아이디/암호를 입력 받아 로그인을 처리하는 AuthenticationFilter에서 사용하게 됩니다.
//
//    CustomUserDetailsService는 UserDetailsService를 구현하고 있는 객체여야 합니다.

//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		http.csrf().disable().authorizeRequests().antMatchers("/", "/main").permitAll().anyRequest().authenticated();

	// http.csrf().disable()는 csrf()라는 기능을 끄라는 설정입니다.
	// csrf는 보안 설정 중 post방식으로 값을 전송할 때 token을 사용해야하는 보안 설정입니다.
	// csrf은 기본으로 설정되어 있는데요. csrf를 사용하게 되면 보안성은 높아지지만 개발초기에는 불편함이 있다는 단점이 있습니다.
	// 그래서 csrf 기능을 끄도록 한 것입니다. disable()메소드는 http(여기에선 HttpSecurity)를 리턴합니다.
	// 이말은 disable().authorizeRequests()는 http.authoriazeRequests()와 같은 의미를 가집니다.
	// /, /main에 대한 요청은 누구나 할 수 있지만,
	// 그 외의 요청은 모두 인증 후 접근 가능합니다.
//	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
//                .csrf().disable()
//                .authorizeRequests()
//                .antMatchers("/", "/main", "/memembers/loginerror", "/members/joinformA", 
//                				"/members/joinA", "/members/welcome").permitAll()
//                .antMatchers("/securepage", "/members/**").hasRole("USER")
//                .anyRequest().authenticated()
//                .and()
//                    .formLogin()
//                    .loginPage("/members/loginform")
//                    .usernameParameter("userId")
//                    .passwordParameter("password")
//                    .loginProcessingUrl("/authenticate")
//                    .failureForwardUrl("/members/loginerror?login_error=1")
//                    .defaultSuccessUrl("/",true)
//                    .permitAll()
//                .and()
//                    .logout()
//                    .logoutUrl("/logout")
//                    .logoutSuccessUrl("/");
				.csrf().disable();
	}

//    로그인 폼에 대해 설정하고 있습니다. 로그인 폼은 "/members/loginform"이 경로라는 것을 의미합니다.
//    해당 경로가 요청 왔을 때 로그인 폼을 보여주는 컨트롤러 메소드를 작성해 줘야 합니다.
//    로그인 폼에서 input태그의 이름은 "userId", "password"이어야 한다는 설정을 하고 있습니다.
//    <input type="text" name="userId">
//    <input type="password" name="password">
//    위와 같은 형태로 설정되야 한다는 것을 의미합니다. 
//    이런 폼에서 값을 입력하고 확인을 누르게 되면 아이디와 암호를 입력 받아 로그인 처리를 하게 되는데요. 
//    그 처리를 해주는 경로는 "/authenticate"라고 설정하고 있습니다.
//    해당 경로는 여러분이 구현하는 것이 아닙니다. 이렇게 설정을 해주면 아이디와 암호를 입력 받아 로그인을 처리하는 
//    스프링 시큐리티 필터가 해당 경로를 검사하다가 아이디와 암호가 전달되면 로그인 과정을 처리하게 됩니다.
//    <form method="post" action="/securityexam/authenticate">
//    위와 같이 로그인 폼의 action부분을 설정해야 합니다. 프로젝트의 컨텍스트 패스가 "/securityexam"이기 때문에 
//    "/authenticate"앞에 "/securityexam"이 붙어 있는 것을 알 수 있습니다.
//    만약 로그인 처리가 실패하게 되면 "/loginerror?login_error=1"로 포워딩 됩니다.
//    해당 경로를 처리하는 컨트롤러 메소드는 개발자가 작성해줘야 합니다.
//    로그인을 성공하게 되면 "/"로 리다이렉트 하게 됩니다.
//    설정에 permitAll()이 붙어 있다는 것은 해당 로그인 폼이 아무나 접근 가능하다는 것

	// 패스워드 인코더를 빈으로 등록합니다. 암호를 인코딩하거나,
	// 인코딩된 암호와 사용자가 입력한 암호가 같은 지 확인할 때 사용합니다.
	@Bean
	public PasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
}