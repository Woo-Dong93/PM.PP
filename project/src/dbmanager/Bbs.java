package dbmanager;

public class Bbs {
	String title;
	String bbs_idx;
	String writer;
	String reg_date;
	String hit;
	String content;
	
	public Bbs(){
		
	}
	public Bbs(String title, String bbs_idx, String writer, String reg_date, String hit, String content) {
		super();
		this.title = title;
		this.bbs_idx = bbs_idx;
		this.writer = writer;
		this.reg_date = reg_date;
		this.hit = hit;
		this.content = content;
	}
	public String getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(String bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}	
}