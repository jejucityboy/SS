package crawl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class News {
	public static String title;
	public static String link;
	public static String text;
	public static String img;
	public static String date;

	public static void main(String[] args) {

		String url = "https://search.daum.net/search?w=news&sort=recency&q=%EC%BD%94%EB%A1%9C%EB%82%98%20%ED%95%99%EA%B5%90%20%EB%93%B1%EA%B5%90%EC%A4%91%EB%8B%A8&cluster=n&DA=STC&dc=STC&pg=1&r=1&p=1&rc=1&at=more&sd=&ed=&period=";
		Document doc = null; // Document에는 페이지의 전체 소스가 저장된다

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		

		Elements element = doc.select("div.coll_cont");

		Iterator<Element> ie1 = element.select("div.wrap_tit").iterator(); // 제목
		Iterator<Element> ie2 = element.select("a.f_link_b").iterator(); // 링크
		Iterator<Element> ie3 = element.select("p.f_eb").iterator(); // 내용
		Iterator<Element> ie4 = element.select("img.thumb_img").iterator(); // 이미지
		Iterator<Element> ie5 = element.select("span.f_nb.date").iterator(); // 작성날짜
		
		List<CrawlDTO> crawl_list = new ArrayList<>();

		while (ie1.hasNext()) {
			
			CrawlDTO crawlDTO = new CrawlDTO();
			
			title = ie1.next().text();
			link = ie2.next().attr("href");
			text = ie3.next().text();
			img = ie4.next().attr("src");
			date = ie5.next().text();

			System.out.println(title + "\n" + link + "\n" + text + "\n" + img + "\n" + date + "\n");
			System.out.println();

			crawlDTO.setArti_tit(title);
			crawlDTO.setArti_link(link);
			crawlDTO.setArti_text(text);
			crawlDTO.setArti_img(img);
			crawlDTO.setArti_date(date);
			
			crawl_list.add(crawlDTO);


		}
		
		CrawlDAO crawlDAO = CrawlDAO.getInstance();
		crawlDAO.deleteAll();
		
		crawlDAO.insertCrawl(crawl_list);
		
		System.out.println("============================================================");
	}
}