package co.team.security.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPay {

	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;

	public KakaoPayReadyVO kakaoPayReady(KakaoNeedInfoVO kakaoVo, HttpServletRequest request) {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "686e9900dca8115e1ea1d6a36c8ffece");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", kakaoVo.getPartner_order_id());
		params.add("partner_user_id", kakaoVo.getPartner_user_id());
		params.add("item_name", kakaoVo.getItem_name());
		params.add("quantity", kakaoVo.getQuantity());
		params.add("total_amount", Integer.toString(kakaoVo.getTotal_amount()));
		params.add("tax_free_amount", Integer.toString(kakaoVo.getTotal_amount()));
		params.add("approval_url", request.getRequestURL().toString().replace(request.getRequestURI(),"")+"/spring/membership/kakaoPaySuccess");
		params.add("cancel_url", request.getRequestURL().toString().replace(request.getRequestURI(),"")+"/spring/membership/kakaoPayCancel");
		params.add("fail_url", request.getRequestURL().toString().replace(request.getRequestURI(),"")+"/spring/membership/kakaoPaySuccessFail");

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);
			System.out.println("kakaoPayReadyVO: "+kakaoPayReadyVO);

			return kakaoPayReadyVO;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		kakaoPayReadyVO.setNext_redirect_pc_url("/pay");
		return kakaoPayReadyVO;

	}

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, KakaoNeedInfoVO kakaoVo) {

		log.info("KakaoPayInfoVO............................................");
		log.info("-----------------------------");

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "686e9900dca8115e1ea1d6a36c8ffece");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoVo.getTid());
		params.add("partner_order_id", kakaoVo.getPartner_order_id());
		params.add("partner_user_id", kakaoVo.getPartner_user_id());
		params.add("pg_token", pg_token);

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			//log.info("" + kakaoPayApprovalVO);

			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
