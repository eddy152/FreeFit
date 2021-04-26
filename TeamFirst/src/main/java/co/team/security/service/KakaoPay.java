package co.team.security.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;

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

	public String kakaoPayReady(KakaoNeedInfoVO kakaoVo, HttpServletRequest request) {

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
		params.add("total_amount", kakaoVo.getTotal_amount());
		params.add("tax_free_amount", kakaoVo.getTotal_amount());
		params.add("approval_url", request.getRequestURL().toString().replace(request.getRequestURI(),"")+"/spring/membership/kakaoPaySuccess");
		params.add("cancel_url", request.getRequestURL().toString().replace(request.getRequestURI(),"")+"/spring/membership/kakaoPayCancel");
		params.add("fail_url", request.getRequestURL().toString().replace(request.getRequestURI(),"")+"/spring/membership/kakaoPaySuccessFail");

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);
			kakaoPayReadyVO.setPartner_order_id(kakaoVo.getPartner_order_id());
			kakaoPayReadyVO.setPartner_user_id(kakaoVo.getPartner_user_id());
			kakaoPayReadyVO.setAll_point(kakaoVo.getAll_point());
			kakaoPayReadyVO.setP_membership_no(kakaoVo.getItem_name());
			kakaoPayReadyVO.setFitness_name(kakaoVo.getFitness_name());
			kakaoPayReadyVO.setFitness_id(kakaoVo.getFitness_id());
			System.out.println("kakaoPayReadyVO: "+kakaoPayReadyVO);

			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/pay";

	}

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {

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
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", kakaoPayReadyVO.getPartner_order_id());
		params.add("partner_user_id", kakaoPayReadyVO.getPartner_user_id());
		params.add("pg_token", pg_token);

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			//log.info("" + kakaoPayApprovalVO);
			kakaoPayApprovalVO.setP_fitness_name(kakaoPayReadyVO.getFitness_name());
			kakaoPayApprovalVO.setP_all_point(kakaoPayReadyVO.getAll_point());
			kakaoPayApprovalVO.setP_fitness_name(kakaoPayReadyVO.getFitness_name());
			kakaoPayApprovalVO.setTax_free_amount(kakaoPayApprovalVO.getAmount().getTotal());
			if(kakaoPayReadyVO.getP_membership_no()=="gold") {
				kakaoPayApprovalVO.setP_membership_no(2);
			}
			else kakaoPayApprovalVO.setP_membership_no(3);
			

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
