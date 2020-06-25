package crawl;

import java.io.Serializable;

public class CrawlDTO implements Serializable {

	private String arti_tit;
	private String arti_link;
	private String arti_text;
	private String arti_img;
	private String arti_date;

	public String getArti_tit() {
		return arti_tit;
	}

	public void setArti_tit(String arti_tit) {
		this.arti_tit = arti_tit;
	}

	public String getArti_link() {
		return arti_link;
	}

	public void setArti_link(String arti_link) {
		this.arti_link = arti_link;
	}

	public String getArti_text() {
		return arti_text;
	}

	public void setArti_text(String arti_text) {
		this.arti_text = arti_text;
	}

	public String getArti_img() {
		return arti_img;
	}

	public void setArti_img(String arti_img) {
		this.arti_img = arti_img;
	}

	public String getArti_date() {
		return arti_date;
	}

	public void setArti_date(String arti_date) {
		this.arti_date = arti_date;
	}

	@Override
	public String toString() {
		return "CrawlDTO [arti_tit=" + arti_tit + ", arti_link=" + arti_link + ", arti_text=" + arti_text
				+ ", arti_img=" + arti_img + ", arti_date=" + arti_date + "]";
	}

}
