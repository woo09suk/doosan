package member.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.ibatis.session.SqlSession;

import config.DB;
import member.dto.MemberDTO;
import sqlmap.MybatisManager;

public class MemberDAO {

	public void join(MemberDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("member.join",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}		
	}

	public String loginCheck(MemberDTO dto) {
		String result = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql 
			= "select * from doosan where userid=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();
			if (rs.next()){//로그인 성공
				result = rs.getString("name") + "님 환영합니다.";
			}else {//로그인 실패
				result = "로그인 실패";
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return result;
	}

	public void update(MemberDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("member.update",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		/*SqlSession session=MybatisManager.getInstance().openSession();
		session.update("member.update",dto);
		session.commit();
		session.close();*/
		
	}

	public MemberDTO detail(String userid) {
		MemberDTO dto=new MemberDTO();
		SqlSession session=MybatisManager.getInstance().openSession();
		dto = session.selectOne("detail", userid);
		session.close();
		return dto;
	}

	public void delete(String userid) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("member.delete",userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		/*SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("member.delete", userid);
		session.commit();
		session.close();*/
	}

	public MemberDTO add(String userid) {
		SqlSession session=null;
		MemberDTO dto=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("member.add",userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		return dto;
	}
}
