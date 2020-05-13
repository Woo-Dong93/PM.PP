package dbmanager;

public class Match {
	String game_idx;
	String applicant;
	String acceptor;
	String status;
	
	String userid;
	String name;
	String nickname;
	String tier;
	
	
	public Match() {
		
	}
	
	public Match(String game_idx, String applicant, String acceptor, String status, String userid, String nickname,
			String tier) {
		this.game_idx = game_idx;
		this.applicant = applicant;
		this.acceptor = acceptor;
		this.status = status;
		this.userid = userid;
		this.nickname = nickname;
		this.tier = tier;
	}
	public String getIdx() {
		return game_idx;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
	public String getAcceptor() {
		return acceptor;
	}
	public void setAcceptor(String acceptor) {
		this.acceptor = acceptor;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getGame_idx() {
		return game_idx;
	}
	public void setGame_idx(String game_idx) {
		this.game_idx = game_idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
