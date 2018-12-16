package ymaster.vo;

public class SchoolFoodVO {
	private String day;
	private String location;
	private String time;
	private String kind;
	private String menu;
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	@Override
	public String toString() {
		return "SchoolFoodVO [day=" + day + ", location =" + location  + ", time =" + time  + ", kind =" + kind  + ", menu  =" + menu + "]";
	}
	
}