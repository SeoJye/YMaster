package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.RouteShareVO;
import ymaster.vo.SchoolFoodVO;

public class SchoolFoodDAO {
	private Connection conn =null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	
	public SchoolFoodVO getSchoolFood(SchoolFoodVO vo){
		String sql = "select * from schoolFood where location=?";
		SchoolFoodVO food = new SchoolFoodVO(); 
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getLocation());
			 rs=stmt.executeQuery();
			if(rs.next()){
				food=new SchoolFoodVO();
				food.setDay(rs.getString("day"));
				food.setLocation(rs.getString("location"));
				food.setTime(rs.getString("time"));
				food.setKind(rs.getString("kind"));
				food.setMenu(rs.getString("menu"));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt,rs);
		}return food;
	}
	////food index 하는거 여기로 ㅎ
	public List<SchoolFoodVO> locateSchoolFoodList() throws SQLException{
		
		List<SchoolFoodVO> food = new ArrayList<SchoolFoodVO>();
		try
		{
			String sql=" select distinct location from schoolfood";
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){ 
				SchoolFoodVO list = new SchoolFoodVO();
				//list.setDay(rs.getString("day"));
				list.setLocation(rs.getString("location"));
				//list.setTime(rs.getString("time"));
				//list.setKind(rs.getString("kind"));
				//list.setMenu(rs.getString("menu"));
				
				food.add(list);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt,rs);
		}
		return food;
		
	}
	
	public List<SchoolFoodVO> getlocationList(SchoolFoodVO vo) throws SQLException
	{
		List<SchoolFoodVO> food = new ArrayList<SchoolFoodVO>();
		
		try
		{
			String sql="select * from schoolFood where location=?";
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getLocation());
			rs=stmt.executeQuery();
			
			while(rs.next()){ 
				SchoolFoodVO list = new SchoolFoodVO();
				list.setDay(rs.getString("day"));
				list.setLocation(rs.getString("location"));
				list.setTime(rs.getString("time"));
				list.setMenu(rs.getString("menu"));
				
				food.add(list);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt,rs);
		}
		return food;
		
	}
	public void deletefood(SchoolFoodVO vo){
		String sql = "delete from SchoolFood where menu=?";
		
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getMenu());
			stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}
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
}