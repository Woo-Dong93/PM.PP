package dbmanager;

public class Member {
	private String idx;
	private String user_name;
	private String user_password;
	private String register_date;
	private String name;
	private String nickname;
	private String email;
	private String tier;
	private String mobile;
	
	public Member(){
		
	}
	public Member(String idx, String user_name, String user_password, String register_date, String name,
			String nickname, String email) {
		super();
		this.idx = idx;
		this.user_name = user_name;
		this.user_password = user_password;
		this.register_date = register_date;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
}