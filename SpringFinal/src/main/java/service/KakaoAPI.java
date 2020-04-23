package service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.MemberDataBean;
import mybatis.MybatisMemberDaoImpl;

public class KakaoAPI {
	@Autowired
	MybatisMemberDaoImpl dbPro;

	
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST ��û�� ���� �⺻���� false�� setDoOutput�� true��
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=3ef8d9de8d6e54b2b36e9a5c816d413d");
			sb.append("&redirect_uri=http://211.63.89.75:9080/SpringFinal/member/kakao_login");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// ��� �ڵ尡 200�̶�� ����
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// ��û�� ���� ���� JSONŸ���� Response �޼��� �о����
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson ���̺귯���� ���Ե� Ŭ������ JSON�Ľ� ��ü ����
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}

	public HashMap<String, Object> getUserInfo(String access_Token) {

		// ��û�ϴ� Ŭ���̾�Ʈ���� ���� ������ �ٸ� �� �ֱ⿡ HashMapŸ������ ����
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// ��û�� �ʿ��� Header�� ���Ե� ����
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
	
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String checkid = properties.getAsJsonObject().get("nickname").getAsString();
			System.out.println(checkid);
		//	System.out.println(email);
		//	MemberDataBean member = dbPro.selectById(checkid);
	
			if(dbPro.selectById(checkid) == null) {
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String id = properties.getAsJsonObject().get("nickname").getAsString();
			String pw = "2222";
			email = kakao_account.getAsJsonObject().get("email").getAsString();
			String name = "īī��";
			String birth = kakao_account.getAsJsonObject().get("birthday").getAsString();
			String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
			System.out.printf(id, pw, email, name, birth, gender);
			System.out.println(nickname);
			System.out.println(email);
			System.out.println(gender);
			System.out.println(birth);
			MemberDataBean member1 = new MemberDataBean(id, pw, email, name, birth, gender);
			dbPro.insert(member1);
			System.out.println("DB�� ȸ�� ���� ���� �Ϸ�");
			} else {
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}


}
