package member;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import member.dao.BoardDAO;
import member.dao.MemberDAO;
import member.dto.BoardCommentDTO;
import member.dto.BoardDTO;
import member.dto.MemberDTO;
import page.Pager;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		MemberDAO dao=new MemberDAO();
		BoardDAO dao2=new BoardDAO();
		if(uri.indexOf("join.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String address=request.getParameter("address");
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setAddress(address);
			dao.join(dto);
			String page=context+"/doosan/main.jsp";
			response.sendRedirect(page);
		}else if(uri.indexOf("login.do") != -1){
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			String page="/doosan/login.jsp";
			if(!result.equals("로그인 실패")){
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page="/doosan/main.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else{
				response.sendRedirect(request.getContextPath()+page+"?message=error");	
			}			
		}else if(uri.indexOf("update.do") != -1){
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String address=request.getParameter("address");
			System.out.println("userid : "+userid);
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setAddress(address);
			dao.update(dto);
			String page="/doosan/main.jsp";
			response.sendRedirect(request.getContextPath()+page);
		}else if(uri.indexOf("add.do")!=-1){
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("userid");			
			MemberDTO dto=dao.add(userid);
			request.setAttribute("dto1", dto);
			String page="/doosan/update.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("logout.do") != -1){
			HttpSession session = request.getSession();
			session.invalidate();
			String page=request.getContextPath()+"/doosan/login.jsp?message=logout";
			response.sendRedirect(page);
		}else if(uri.indexOf("delete.do")!=-1){
			HttpSession session = request.getSession();
			String userid=(String)session.getAttribute("userid");
			dao.delete(userid);
			session.invalidate();
			String page="/doosan/main.jsp";
			response.sendRedirect(request.getContextPath()+page);
		}else if(uri.indexOf("list.do")!=-1){
			int count=dao2.count();
			int curPage=1;
			if(request.getParameter("curPage")!=null){
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<BoardDTO> list=dao2.list(start, end);
			request.setAttribute("list", list);
			String page="/doosan/list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("search.do")!=-1){
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			List<BoardDTO> list=dao2.searchList(search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			String page="/doosan/search.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("insert.do")!=-1){
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()){
				uploadDir.mkdir();
			}
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();
			String filename=" ";
			int filesize=0;
			try {
				Enumeration files=multi.getFileNames();
				while(files.hasMoreElements()){
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1!=null){
						filesize=(int)f1.length();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			BoardDTO dto=new BoardDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			if(filename==null || filename.trim().equals("")){
				filename="-";
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			dao2.insert(dto);
			String page="/member_servlet/list.do";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("view.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			dao2.plusReadCount(num, session);
			BoardDTO dto=dao2.viewReplace(num);
			request.setAttribute("dto", dto);
			String page="/doosan/view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("commentList.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			List<BoardCommentDTO> list=dao2.commentList(num);
			request.setAttribute("list", list);
			String page="/doosan/comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);			
		}else if(uri.indexOf("comment_add.do")!=-1){
			BoardCommentDTO dto=new BoardCommentDTO();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setBoard_num(board_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao2.commentAdd(dto);
		}else if(uri.indexOf("reply.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao2.view(num);
			dto.setContent("===게시물의내용===\n"+dto.getContent());
			request.setAttribute("dto", dto);
			String page="/doosan/reply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("insertReply.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao2.view(num);
			int ref=dto.getRef();
			int re_step=dto.getRe_step()+1;
			int re_level=dto.getRe_level()+1;
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("contetn");
			String passwd=request.getParameter("passwd");
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_level(re_level);
			dto.setRe_step(re_step);
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);		
			dao2.updateStep(ref, re_step);
			dao2.reply(dto);
			String page="/member_servlet/list.do";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("pass_check.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			String passwd=request.getParameter("passwd");
			String result=dao2.passwdCheck(num, passwd);
			String page="";
			if(result != null){
				page="/doosan/edit.jsp";
				request.setAttribute("dto", dao2.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{
				page=context+"/member_servlet/view.do?num="+num+"&message=error";
				response.sendRedirect(page);
			}
		}else if(uri.indexOf("update2.do")!=-1){
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()){
				uploadDir.mkdir();
			}
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			int num=Integer.parseInt(multi.getParameter("num"));
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();
			String filename=" ";
			int filesize=0;
			try {
				Enumeration files=multi.getFileNames();
				while(files.hasMoreElements()){
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null){
						filesize=(int)f1.length();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			BoardDTO dto=new BoardDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			if(filename == null || filename.trim().equals("")){
				BoardDTO dto2=dao2.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else{
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			String fileDel=multi.getParameter("fileDel");
			if(fileDel != null && fileDel.equals("on")){
				String fileName=dao2.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete();
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			dao2.update2(dto);
			String page="/member_servlet/list.do";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("delete2.do")!=-1){
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			int num=Integer.parseInt(multi.getParameter("num"));
			dao2.delete2(num);
			String page="/member_servlet/list.do";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("download.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao2.getFileName(num);
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096];
			FileInputStream fis=new FileInputStream(path);
			String mimeType=getServletContext().getMimeType(path);
			if(mimeType==null){
				mimeType="application/octet-stream;charset=utf-8";
			}
			filename=new String(filename.getBytes("utf-8"),"8859_1");
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true){
				numRead=fis.read(b,0,b.length);
				if(numRead == -1) break;
				out.write(b,0,numRead);
			}
			out.flush();
			out.close();
			fis.close();
			dao2.plusDown(num);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
