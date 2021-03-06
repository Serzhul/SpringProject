package model;

import java.io.Serializable;
import java.util.Map;

/*얘가 POJO 클래스
 * POJO = Java Beans
여기서 Java Beans는 Sun의 Java Beans나 EJB의 Bean을 뜻하는것이 아닌
순수하게 setter, getter 메소드로 이루어진 Value Object성의 Bean을 말한다.
 * */

public class Member implements Serializable {

	private String id;
	private String pw;
	private String email;
	private String name;
	private String birth;
	private String gender;
	private String auth;

	// 비밀번호 맞는지 확인 -> 근데 이거 javascript로 처리하면 안되나?
	private String confirmPw;
	 public Member(){}

	public void setConfirmpw(String confirmpw) {
		this.confirmPw = confirmpw;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getBirth() {
		return birth;
	}

	public String getGender() {
		return gender;
	}

	public String getAuth() {
		return auth;
	}

	public String getConfirmpw() {
		return confirmPw;
	}

	//비밀번호 재설정
	public void changePassword(String newPwd) {
		this.pw = newPwd;
	}

	public boolean matchPassword(String pwd) {
		return pw.equals(pwd);
	}

	public boolean isPasswordEqualToConfrim() {
		return pw != null && pw.equals(confirmPw);
	}
	
	// 기본 생정자
	public Member(String id, String pw, String email, String name, String birth, String gender, String auth,
			String confirmPw) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.auth = auth;
		this.confirmPw = confirmPw;
	}

	// Noraml은 일반회원
	// 일반회원 Dao에서 insert문에 쓰이는 생성자
	public Member(String id, String pw, String email, String name, String birth, String gender) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.auth = "Noraml";
	}
	
	// 컨트롤러에서 join할때 쓰이는 생성자
	public Member(String id, String pw, String email, String name, String birth, String gender, String confirmPw) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.auth = "Noraml";
		this.confirmPw = confirmPw;
	}

	public Member(String id, String name, String auth) {
		this.id = id;
		this.name = name;
		this.auth = auth;
	}

	public void vaildate(Map<String, Boolean> errors) {
		checkEmpty(errors, id, "id");
		checkEmpty(errors, pw, "pw");
		checkEmpty(errors, email, "email");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, birth, "birth");
		checkEmpty(errors, gender, "gender");
		checkEmpty(errors, confirmPw, "confirmPw");
		if (!errors.containsKey("confirmPw")) {
			if (!isPasswordEqualToConfrim()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}

	private void checkEmpty(Map<String, Boolean> erros, String value, String filedName) {
		if (value == null || value.isEmpty())
			erros.put(filedName, Boolean.TRUE);
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", auth=" + auth + ", confirmPw=" + confirmPw + "]";
	}
	
	

}
