<%@page import="utils.JSFunction"%>
<%@page import="boardwriting.boardWritingDTO"%>
<%@page import="boardwriting.boardWritingDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*파일 업로드를 위한 디렉토리의 물리적경로(절대경로)를 얻어온다.
물리적경로가 필요한 이유는 운영체제에 따라 경로를 표현하는 방식이
다르기 때문이다. */ 
String saveDirectory = application.getRealPath("/Uploads");
//업로드할 파일의 최대용량제한(1mb로 지정함)
int maxPostSize = 1024 * 1000;
//인코딩 방식 지정
String encoding = "UTF-8";
	try{
		/*
		앞에서 준비한 3개의 인수와 request내장객체까지를 이용해서
		MultipartRequest객체를 생성한다. 해당 객체가 정상적으로 생성되면
		파일 업로드는 완료된다.
		*/
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		boardWritingDTO dto = new boardWritingDTO();
		
		
		if(mr.getFilesystemName("attachedFile") != null){
			
		
		//mr 객체를 통해 서버에 저장된 파일명을 가져온다.
		String fileName = mr.getFilesystemName("attachedFile");
		/* 파일명에서 확장자 앞의  .(닷)을 찾아 인덱스를 확인한 후 확장자를 
		잘라낸다. 확장자는 파일의 용도를 나타내는 부분이므로 중요하다.
		파일명에 .(닷)을 여러개 사용할 수 있으므로 끝에서 부터 찾는 lastIndexOf를 사용*/
		String ext = fileName.substring(fileName.lastIndexOf("."));
		/* 현재 날짜와 시간 및 밀리세컨즈까지 이용해서 파일명으로 사용할 문자열을
		만든다 */
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		//확장자와 파일명을 합쳐서 서버에 저장할 파일명을 만들어준다.
		String newFileName = now + ext;
		
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		}
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String b_flag = mr.getParameter("b_flag");//플레그 추가
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setB_flag(b_flag);
		dto.setId(session.getAttribute("UserId").toString());

		
		
		boardWritingDAO dao = new boardWritingDAO(application);
		dao.insertWrite(dto);
		//자원반납(커넥션풀에 Coonection객체를 반납한다.)
		dao.close();
		
		//파일업로드에 성공한 경우 파일목록으로 이동한다.
		response.sendRedirect("writingList.jsp?b_flag="+b_flag); 
		
	}
	catch(Exception e){
		/* 파일업로드에 실패한 경우에는 request영역에 에러메세지를
		저장한 후 업로드폼으로 포워드한다. */
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
	}
	


%>