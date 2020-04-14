package model;

import java.io.Serializable;
import java.util.Map;

/*얘가 POJO 클래스
 * POJO = Java Beans
여기서 Java Beans는 Sun의 Java Beans나 EJB의 Bean을 뜻하는것이 아닌
순수하게 setter, getter 메소드로 이루어진 Value Object성의 Bean을 말한다.
 * */

public class MemberDataBean implements Serializable {

	private String id;
	private String pw;
	private String email;
	private String name;
	private String birth;
	private String gender;
	private String auth;
	private String confirmPw;
	private String newPw;

	public MemberDataBean() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getConfirmPw() {
		return confirmPw;
	}

	public void setConfirmPw(String confirmPw) {
		this.confirmPw = confirmPw;
	}

	public String getNewPw() {
		return newPw;
	}

	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}

	// 비밀번호 재설정
	public void changePassword(String newPwd) {
		this.pw = newPwd;
	}

	public boolean matchPassword(String pwd) {
		return pw.equals(pwd);
	}
	
	// 아이디 찾기 할 때 쓰는 이메일
	public boolean matchEmail(String email) {
		return email.equals(email);
	}
	
	
	// 아이디 지울 때 쓰는 비밀번호
	public boolean matchPw(String pw) {
		return pw.equals(pw);
	}
	
	
	// 비밀번호 찾기 할 때 쓰는 이메일
		public boolean matchEmailAndId(String email, String id) {
			return email.equals(email) && id.equals(id);
		}

	public boolean isPasswordEqualToConfrim() {
		return pw != null && pw.equals(confirmPw);
	}
	
	public String getConfirmpasswd() {
		return confirmPw;
	}

	// 기본 생정자
/*	public MemberDataBean(String id, String pw, String email, String name, String birth, String gender, String auth) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.auth = auth;
	}*/

	// Noraml은 일반회원
	// 일반회원 Dao에서 insert문에 쓰이는 생성자
	public MemberDataBean(String id, String pw, String email, String name, String birth, String gender) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.auth = "Noraml";
	}

	public MemberDataBean(String id, String pw, String email, String name, String birth, String gender, String auth) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.auth = "Noraml";
	}
	// 컨트롤러에서 join할때 쓰이는 생성자
/*	public MemberDataBean(String id, String pw, String email, String name, String birth, String gender) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.auth = "Noraml";
	}*/

	public MemberDataBean(String id, String name, String auth) {
		this.id = id;
		this.name = name;
		this.auth = auth;
	}

	// 아이디 찾았을 때
	public MemberDataBean(String id, String email) {
		this.id = id;
		this.email = email;
	}


	public void vaildate(Map<String, Boolean> errors) {
		checkEmpty(errors, id, "id");
		checkEmpty(errors, pw, "pw");
		checkEmpty(errors, email, "email");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, birth, "birth");
		checkEmpty(errors, gender, "gender");
	}

	private void checkEmpty(Map<String, Boolean> erros, String value, String filedName) {
		if (value == null || value.isEmpty())
			erros.put(filedName, Boolean.TRUE);
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", auth=" + auth + "]";
	}

}
