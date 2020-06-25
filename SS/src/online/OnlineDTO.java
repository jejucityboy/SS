package online;

import java.io.Serializable;

public class OnlineDTO implements Serializable {

	private double sh_location1;
	private double sh_location2;
	private String sh_name;
	private String sh_state;
	private String sh_address2;

	public double getSh_location1() {
		return sh_location1;
	}

	public void setSh_location1(double sh_location1) {
		this.sh_location1 = sh_location1;
	}

	public double getSh_location2() {
		return sh_location2;
	}

	public void setSh_location2(double sh_location2) {
		this.sh_location2 = sh_location2;
	}

	public String getSh_name() {
		return sh_name;
	}

	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}
	
	public String getSh_state() {
		return sh_state;
	}

	public void setSh_state(String sh_state) {
		this.sh_state = sh_state;
	}
	
	public String getSh_address2() {
		return sh_address2;
	}

	public void setSh_address2(String sh_address2) {
		this.sh_address2 = sh_address2;
	}
	@Override
	public String toString() {
		return "DeptDTO [sh_location1=" + sh_location1 + ", sh_location2=" + sh_location2 + ", sh_name=" + sh_name + ", sh_state=" + sh_state + ", sh_address2=" + sh_address2 + "]";
	}
}
