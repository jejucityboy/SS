package crawl;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class News {
	   public static void main(String[] args) {
	      
	      String url = "https://search.daum.net/search?w=news&nil_search=btn&DA=NTB&enc=utf8&cluster=y&cluster_page=1&q=%EC%BD%94%EB%A1%9C%EB%82%98%20%EC%9D%B8%EC%B2%9C%20%ED%95%99%EA%B5%90"; 
	      Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다

	      try {
	         doc = Jsoup.connect(url).get();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	      Elements element = doc.select("div.coll_cont");

	      System.out.println("============================================================");

	      System.out.println("============================================================");
	   }
	}