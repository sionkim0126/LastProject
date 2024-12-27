package museum;

public class Page {
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
	String pagingStr = "";
	int totalPages =(int)(Math.ceil(((double)totalCount / pageSize)));
	
	int pageTemp = (((pageNum -1) / blockPage)* blockPage) + 1;
	if(pageTemp != 1) {
		pagingStr += "<a href='" + reqUrl + "?pageNum=1'>Frist</a>";
		pagingStr += "&nbsp;";
		pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp -1)
					+"'> ◀ </a>";
	}
	
	 int blockCount = 1;
     while (blockCount <= blockPage && pageTemp <= totalPages) {
         if (pageTemp == pageNum) {
             // 현재 페이지는 링크를 걸지 않음
             pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
         } else {
             pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp
                          + "'>" + pageTemp + "</a>&nbsp;";
         }
         pageTemp++;
         blockCount++;
     }
     
  // 단계 6 : '다음 페이지 블록 바로가기' 출력
     if (pageTemp <= totalPages) {
         pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
                      + "'> ▶ </a>";
         pagingStr += "&nbsp;";
         pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages
                      + "'>Last</a>";
     }
		
		return pagingStr;
	}
}
