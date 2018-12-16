package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.SchoolFoodVO;

public class SchoolFoodDAO {
	private Connection conn =null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public List<SchoolFoodVO> getisList() throws SQLException
	{
		List<SchoolFoodVO> food = new ArrayList<SchoolFoodVO>();
		SchoolFoodVO is = new SchoolFoodVO(); 
		String iS="인성관";
		is.setLocation(iS);
		try
		{
			String sql="select * from schoolFood where location=?";
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, is.getLocation());
			rs=stmt.executeQuery();
			
			while(rs.next()){ 
				SchoolFoodVO vo = new SchoolFoodVO();
				vo.setDay(rs.getString("day"));
				vo.setLocation(rs.getString("location"));
				vo.setTime(rs.getString("time"));
				vo.setKind(rs.getString("kind"));
				vo.setMenu(rs.getString("menu"));
				
				food.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt,rs);
		}
		return food;
		
	}
	public List<SchoolFoodVO> getssList() throws SQLException
	{
		List<SchoolFoodVO> food = new ArrayList<SchoolFoodVO>();
		SchoolFoodVO ss = new SchoolFoodVO(); 
		String sS="생활관";
		ss.setLocation(sS);
		try
		{
			String sql="select * from schoolFood where location=?";
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ss.getLocation());
			rs=stmt.executeQuery();
			
			while(rs.next()){ 
				SchoolFoodVO vo = new SchoolFoodVO();
				vo.setDay(rs.getString("day"));
				vo.setLocation(rs.getString("location"));
				vo.setTime(rs.getString("time"));
				vo.setMenu(rs.getString("menu"));
				
				food.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt,rs);
		}
		return food;
		
	}
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
	
	
}