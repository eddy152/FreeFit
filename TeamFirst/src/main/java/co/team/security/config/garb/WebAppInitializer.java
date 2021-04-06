package co.team.security.config.garb;
//package co.team.security.config;
//
//import javax.servlet.Filter;
//
//import org.springframework.security.access.SecurityConfig;
//import org.springframework.web.filter.CharacterEncodingFilter;
//import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
//
//// AbstractAnnotationConfigDispatcherServletInitializer 는 spring MVC 를 사용할 경우에 상속받아서 구현하면 편리
//public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
//	
//
////1. web.xml 또는 web.xml파일을 대신하는 자바 Config설정 파일
////  ● WebAppInitializer.java 파일을 작성합니다.
////2. 스프링 설정파일
////  ● ApplicationConfig.java 파일을 작성합니다.
////3. 스프링 MVC설정파일
////  ● MvcConfig.java 클래스를 작성합니다.
//	
////4. 스프링 시큐리티 설정파일
////  ● SecurityWebApplicationInitializer.java 클래스를 작성합니다.
////  ● SecurityConfig.java 클래스를 작성합니다.
//
//
//	
//    // Spring Config 파일을 설정한다.
//    @Override
//    protected Class<?>[] getRootConfigClasses() {
//        return new Class<?>[]{ApplicationConfig.class, SecurityConfig.class};
//    }
//
//    // Spring WEB Config 파일을 설정한다. WebConfig는 Bean을 RootConfig에서 설정한 곳에서부터 찾는다.
//    @Override
//    protected Class<?>[] getServletConfigClasses() {
//        return new Class<?>[]{MvcConfig.class};
//    }
//
//    /*
//    getServletMapping()은 DispatcherServlet이 매핑되기 위한 하나 혹은 여러 개의 패스를 지정한다.
//   위의 코드에서는 애플리케이션 기본 서블릿인 /에만 매핑이 되어 있다. 그리고 이것은 애플리케이션으로 들어오는 모든 요청을 처리한다.
//   원래 서블릿에서는 / 을 처리하는 DefaultServlet이 설정되어 있다.
//     */
//    @Override
//    protected String[] getServletMappings() {
//        return new String[]{"/"};
//    }
//
//    /*
//    필터를 설정한다.
//     */
//    @Override
//    protected Filter[] getServletFilters() {
//        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
//        encodingFilter.setEncoding("UTF-8");
//
//        return new Filter[]{encodingFilter};
//    }
//}