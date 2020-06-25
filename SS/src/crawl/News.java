package crawl;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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


      Iterator<Element> ie1 = element.select("div.wrap_tit").iterator(); //제목
      Iterator<Element> ie2 = element.select("a.f_link_b").iterator(); //링크
      Iterator<Element> ie3 = element.select("p.f_eb").iterator(); //내용
      Iterator<Element> ie4 = element.select("img.thumb_img").iterator(); //이미지
      Iterator<Element> ie5 = element.select("span.f_nb.date").iterator(); //작성날짜
      
      while (ie1.hasNext()) {
         System.out.println(ie1.next().text()+"\n"+ie2.next().attr("href")
               +"\n"+ie3.next().text()+"\n"+ie4.next().attr("src")+"\n"+ie5.next().text());      
         System.out.println();
      }
      System.out.println("============================================================");
   }
}