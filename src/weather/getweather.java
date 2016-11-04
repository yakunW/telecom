package weather;
import java.net.URL;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class getweather {
 static String weather; // 保存天气情况
 static String high; // 保存当天最高温度
 static String low; // 保存当天最低温度
 static Element root;
 public static String get_weather() // 获取天气函数
 {
  
   URL ur;
   try {
    DocumentBuilderFactory domfac = DocumentBuilderFactory.newInstance(); // 获得DOM工厂对象 引自import
          // javax.xml.parsers.DocumentBuilderFactory;类
    DocumentBuilder dombuilder = domfac.newDocumentBuilder();
    Document doc; // 创建文档对象
    NodeList books;
    
     ur = new URL("http://php.weather.sina.com.cn/xml.php?city=铜川&password=DJOYnieT8234jlsK&day=0");
     doc = dombuilder.parse(ur.openStream());
     root = doc.getDocumentElement();
     books = root.getChildNodes();
     for (Node node = books.item(1).getFirstChild(); node != null; node = node.getNextSibling

()) {
      if (node.getNodeType() == Node.ELEMENT_NODE) {
       if (node.getNodeName().equals("status1"))
        weather = node.getTextContent(); // 获取到天气情况
       else if (node.getNodeName().equals("temperature1"))
        high = node.getTextContent(); // 获取到最高温度
       else if (node.getNodeName().equals("temperature2"))
        low = node.getTextContent(); // 获取到最低温度
      }
     }
     return "铜川市" + " " + weather + "<br>" + low + "℃~" + high + "℃"; // 前台输出
    
   } catch (Exception e) {
    return "获取天气失败:" + e;
   }
  }
 }

