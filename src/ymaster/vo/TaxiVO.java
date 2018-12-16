package ymaster.vo;

import java.sql.Date;

public class TaxiVO {

	private String seq;
	private String title;
	private String writer;
	private String starting;
	private String destination;
	private String time;
	private int timeHour;
	private int timeMinute;
	private String content;
	private Date regdate;
	
	public TaxiVO() {
		super();
	}

	public TaxiVO(String seq,String title,String writer, String starting, String destination,int timeHour, String time,int timeMinute,String content, Date regdate) {
		super();
		this.seq = seq;
		this.title=title;
		this.writer = writer;
		this.starting = starting;
		this.destination=destination;
		this.timeHour=timeHour;
		this.time=time;
		this.timeMinute=timeMinute;
		this.content = content;
		this.regdate = regdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getStarting() {
		return starting;
	}

	public void setStarting(String starting) {
		this.starting = starting;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}



	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getTimeHour() {
		return timeHour;
	}

	public void setTimeHour(int timeHour) {
		this.timeHour = timeHour;
	}

	public int getTimeMinute() {
		return timeMinute;
	}

	public void setTimeMinute(int timeMinute) {
		this.timeMinute = timeMinute;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "Taxi[seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content +", starting=" + starting + ", destination=" 
	+ destination +", time=" + time +", timeHour=" + timeHour +", timeMinute=" + timeMinute +", regdate=" + regdate + "]";
	}
	
}
