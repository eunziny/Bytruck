package vo;

import java.util.Arrays;

public class Tripcourse {
   private int no;
   private int step;
   private String user;
   private String title;
   private String detail;
   private String with;
   private String date;
   private int good;
   private String[] xlocation;
   private String[] ylocation;
   private String xlocationS;
   private String ylocationS;
   
   	public Tripcourse() {
	   	super();
	   // TODO Auto-generated constructor stub
   	}
   	
   public Tripcourse(int no, int step, String date, String title, String detail, String ylocationS	, String xlocationS) {
		super();
		this.no = no;
		this.step = step;
		this.date = date;	
		this.title = title;
		this.detail = detail;
		this.xlocationS = xlocationS;
		this.ylocationS = ylocationS;
	}
   
   public Tripcourse(int no, int step, String user, String title, String detail, String with, String date, int good,
			String[] xlocation, String[] ylocation, String xlocationS, String ylocationS) {
		super();
		this.no = no;
		this.step = step;
		this.user = user;
		this.title = title;
		this.detail = detail;
		this.with = with;
		this.date = date;
		this.good = good;
		this.xlocation = xlocation;
		this.ylocation = ylocation;
		this.xlocationS = xlocationS;
		this.ylocationS = ylocationS;
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getStep() {
		return step;
	}
	
	public void setStep(int step) {
		this.step = step;
	}
	
	public String getUser() {
		return user;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public String getWith() {
		return with;
	}
	
	public void setWith(String with) {
		this.with = with;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getGood() {
		return good;
	}
	
	public void setGood(int good) {
		this.good = good;
	}
	
	public String[] getXlocation() {
		return xlocation;
	}
	
	public void setXlocation(String[] xlocation) {
		this.xlocation = xlocation;
	}
	
	public String[] getYlocation() {
		return ylocation;
	}
	
	public void setYlocation(String[] ylocation) {
		this.ylocation = ylocation;
	}
	
	public String getXlocationS() {
		return xlocationS;
	}
	
	public void setXlocationS(String xlocationS) {
		this.xlocationS = xlocationS;
	}
	
	public String getYlocationS() {
		return ylocationS;
	}
	
	public void setYlocationS(String ylocationS) {
		this.ylocationS = ylocationS;
	}

	@Override
	public String toString() {
		return "Tripcourse [no=" + no + ", step=" + step + ", user=" + user + ", title=" + title + ", detail=" + detail
				+ ", with=" + with + ", date=" + date + ", good=" + good + ", xlocation=" + Arrays.toString(xlocation)
				+ ", ylocation=" + Arrays.toString(ylocation) + ", xlocationS=" + xlocationS + ", ylocationS="
				+ ylocationS + "]";
	}
		     	
}