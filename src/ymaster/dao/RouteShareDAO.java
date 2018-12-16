package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.RouteShareVO;


public class RouteShareDAO {

	private Connection conn =null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	
	public List<RouteShareVO> getRouteShareList() throws SQLException
	{		
		List<RouteShareVO> share = new ArrayList<RouteShareVO>();
		try
		{
			String sql = "select * from routeShare order by regdate desc";
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){ 
				RouteShareVO list = new RouteShareVO();
				list.setSeq(rs.getString("seq"));
				list.setTitle(rs.getString("title"));
				list.setWriter(rs.getString("writer"));
				list.setRegdate(rs.getDate("regdate"));
				list.setCnt(rs.getInt("cnt"));

				share.add(list);
			}
		}catch(Exception e){
				e.printStackTrace();
		}finally{
				JDBCUtil.close(conn, stmt,rs);
		}return share;
		
	}
	public RouteShareVO getRouteShare(RouteShareVO vo){
		String sql = "select * from routeShare where seq=?";
		RouteShareVO board =new RouteShareVO();
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getSeq());
			rs = stmt.executeQuery();
			if(rs.next()){
				
				board.setSeq(rs.getString("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
				
			}
			
			sql= "update routeShare set cnt = cnt+1 where seq=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getSeq());
			stmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}return board;
	}
	
	
	public String getNext() {

		String sql = "SELECT seq FROM routeShare where rownum=1 ORDER BY seq DESC";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				int rnum=Integer.parseInt(rs.getString(1).substring(1));
				String result = "S00000";
				
				if((rnum + 1) < 10) 
					result = rs.getString(1).substring(0,1) + "0000" + (rnum+1);
				else if((rnum + 1) < 100)
					result = rs.getString(1).substring(0,1) + "000" + (rnum+1);
				else if((rnum + 1) < 1000)
					result = rs.getString(1).substring(0,1) + "00" + (rnum+1);
				else if((rnum + 1) < 10000)
					result = rs.getString(1).substring(0,1) + (rnum+1);
				
				return result;
			}
			return "S00001"; // 첫 번째 게시글인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "S00000"; // 데이터베이스 오류
	}
	

	public void insertRouteShare(RouteShareVO vo){
		String sql = "insert into routeShare(seq, title, writer,content,password) values(?,?,?,?,?)";
		
		//System.out.println("sql->insert into routeShare(seq, title, writer,content,password) "
			//	+ "values("+getNext()+","+vo.getTitle()+","+vo.getWriter()+","+vo.getContent()+","+vo.getPassword()+")" );
		
		vo.setSeq(getNext());
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getSeq());
			stmt.setString(2, vo.getTitle());
			stmt.setString(3, vo.getWriter());
			stmt.setString(4, vo.getContent());
			stmt.setInt(5, vo.getPassword());
			rs = stmt.executeQuery();
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void updateRouteShare(RouteShareVO vo){
		String sql = "update routeShare set title=?, content=? where seq=?";
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setString(3, vo.getSeq());
			stmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}
		
	}
	

	
	public int check(int password, String seq)throws SQLException{
		String sql ="select password from routeShare where seq=?";
		
		System.out.print("checkpw="+password);
		System.out.println("Seq="+seq);
		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seq);
			rs = stmt.executeQuery();
			if(rs.next()) 
			{
				System.out.println("패스워드 일치"+rs.getString("password"));
				if(rs.getString("password").equals(String.valueOf(password))) {
					System.out.println("패스워드 일치");
					
					return 1;//일치
				}else{
					System.out.println("비밀번호 불일치");
					return 0; // 비밀번호 불일치
				}
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		System.out.println("데이터 베이스 오류");
		return -1; // 데이터베이스 오류
		
	}
	public void deleteRouteShare(RouteShareVO vo){
		String sql = "delete from routeShare where seq=? and password=?";
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getSeq());
			stmt.setInt(2, vo.getPassword());
			stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}
	}
}