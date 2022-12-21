package utils;

public class BoardHomePage2 {

	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
	
		StringBuffer pagingStr = new StringBuffer();
		int totalPages = (int)Math.ceil((double)totalCount / pageSize);
		
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		
		pagingStr.append("<nav aria-label='Page navigation example'>");
		pagingStr.append("<ul class='pagination'>");
		
		if (pageTemp != 1) {
			pagingStr.append("<li class='page-item'>");
			pagingStr.append("<a class='page-link' href='" + reqUrl + "?pageNum=1'><i class='bi bi-skip-backward-fill'></i></a></li>");
			pagingStr.append("<li class='page-item'>");
			pagingStr.append("<a class='page-link' href='" + reqUrl + "?pageNum="+ (pageTemp - 1)
					+ "'><i class='bi bi-skip-start-fill'></i></a></li>");
		}
		
		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages ) {
			
			if (pageTemp == pageNum) {
				pagingStr.append("<li class='page-item active'><a class='page-link' href='"+pageTemp+"''>"+pageTemp+"</a></li>");
			}
			else {
				
				pagingStr.append("<li class='page-item'><a class='page-link' href='"+ reqUrl + "?pageNum=" + pageTemp
						+ "'>" + pageTemp + "</a></li>");
			}
			pageTemp++;
			blockCount++;
		}
		if (pageTemp <= totalPages) {
			pagingStr.append("<a class='page-link' href='" + reqUrl + "?pageNum=" + pageTemp
						+ "'><i class='bi bi-skip-end-fill'></i></a>");
			pagingStr.append("<a class='page-link' href='" + reqUrl + "?pageNum=" + totalPages
						+ "'><i class='bi bi-skip-forward-fill'></i></a>");
		}
		
		pagingStr.append("</ul>");
		pagingStr.append("</nav>");
		
		return pagingStr.toString();
		
	}

}
