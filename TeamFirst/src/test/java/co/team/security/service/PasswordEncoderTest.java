package co.team.security.service;

import org.junit.Test;

import co.team.food.service.FoodVO;


public class PasswordEncoderTest {


    @Test
    public void passwordEncode() throws Exception{
    	//String str ="하하.png";
    	//String word = str.split("\\.")[str.split("\\.").length -1];
    	//System.out.println(word);
    	//String list [] = str.split(".");
		/*
		 * for(int i=0; i<list.length; i++) { System.out.println(list[i]); }
		 */
//    	System.out.println(getRandomStr(8));
    	
    
    }
    
    
    public static String getRandomStr(int size) {
		if(size > 0) {
			char[] tmp = new char[size];
			for(int i=0; i<tmp.length; i++) {
				int div = (int) Math.floor( Math.random() * 2 );
				
				if(div == 0) { // 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0') ;
				}else { //1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A') ;
				}
			}
			return new String(tmp);
		}
		return "ERROR : Size is required."; 
	}
    
    
    
    
    //    @Test
//    public void passwordTest() throws Exception{
//    	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//    	String encodePasswd = "$2a$10$lkaOPkitBlBtu7HPb6U3tuW4LP7VPv8eun1RzzHN3Oz6CkiJt9HGW";
//    	String password = "1234";
//    	boolean test = passwordEncoder.matches(password, encodePasswd);
//    	System.out.println(test);
//    }
}