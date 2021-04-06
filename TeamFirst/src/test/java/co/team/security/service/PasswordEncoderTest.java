package co.team.security.service;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


public class PasswordEncoderTest {


    @Test
    public void passwordEncode() throws Exception{
    	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	
        System.out.println(passwordEncoder.encode("1234"));
    }
    
    @Test
    public void passwordTest() throws Exception{
    	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	String encodePasswd = "$2a$10$lkaOPkitBlBtu7HPb6U3tuW4LP7VPv8eun1RzzHN3Oz6CkiJt9HGW";
    	String password = "1234";
    	boolean test = passwordEncoder.matches(password, encodePasswd);
    	System.out.println(test);
    }
}