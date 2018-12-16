package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.TaxiVO;

public class TaxiDAO {
	private Connection conn =null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	public List<TaxiVO> getTaxiList() throws SQLException
	{		
		List<TaxiVO> taxi = new ArrayList<TaxiVO>();
		try
		{
			String sql = " select * from taxi ORDER BY time asc, timeHour desc,timeMinute asc, regdate asc ";
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){ 
				TaxiVO list = new TaxiVO();
				list.setSeq(rs.getString("seq"));
				list.setTitle(rs.getString("title"));
				list.setWriter(rs.getString("writer"));
				list.setStarting(rs.getString("starting"));
				list.setDestination(rs.getString("destination"));
				list.setTime(rs.getString("time"));
				list.setTimeHour(rs.getInt("timeHour"));
				list.setTimeMinute(rs.getInt("timeMinute"));
				list.setRegdate(rs.getDate("regdate"));
				taxi.add(list);
			}
		}catch(Exception e){
				e.printStackTrace();
		}finally{
				JDBCUtil.close(conn, stmt,rs);
		}return taxi;
		
	}
	public TaxiVO getTaxi(TaxiVO vo){
		String sql = "select * from taxi where seq=?";
		
		TaxiVO taxi =new TaxiVO();
		//System.out.print(taxi.getSeq());
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getSeq());
			rs = stmt.executeQuery();
			if(rs.next()){
				
				taxi.setSeq(rs.getString("seq"));
				taxi.setTitle(rs.getString("title"));
				taxi.setWriter(rs.getString("writer"));
				taxi.setStarting(rs.getString("starting"));
				taxi.setDestination(rs.getString("destination"));
				taxi.setTime(rs.getString("time"));
				taxi.setTimeHour(rs.getInt("timeHour"));
				taxi.setTimeMinute(rs.getInt("timeMinute"));
				taxi.setContent(rs.getString("content"));
				taxi.setRegdate(rs.getDate("regdate"));
				
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}return taxi;
	}
	
	
	public String getNext() {

		String sql = "SELECT seq FROM taxi where rownum=1 ORDER BY seq DESC";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				int rnum=Integer.parseInt(rs.getString(1).substring(1));
				String result = "T00000";
				
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
			return "T00001"; // 첫 번째 게시글인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "T00000"; // 데이터베이스 오류
	}
	

	public void insertTaxi(TaxiVO vo){
		String sql = "insert into taxi(seq, title, writer,starting, destination,time,timeHour,timeMinute,content) values(?,?,?,?,?,?,?,?,?)";
		
		vo.setSeq(getNext());

		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getSeq());
			stmt.setString(2, vo.getTitle());
			stmt.setString(3, vo.getWriter());
			stmt.setString(4, vo.getStarting());
			stmt.setString(5, vo.getDestination());
			stmt.setString(6, vo.getTime());		
			stmt.setInt(7, vo.getTimeHour());
			stmt.setInt(8, vo.getTimeMinute());
			stmt.setString(9, vo.getContent());
			stmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void updateTaxi(TaxiVO vo){
		String sql = "update taxi set title=?,starting=?,destination=?,time=?,timeHour=?,timeMinute=?, content=? where seq=?";
		//System.out.println("update taxi set title="+vo.getTitle() +" writer="+vo.getWriter() +"starting="+vo.getStarting()
		//+"destination="+vo.getDestination() +"limitTime="+vo.getLimitTime() +"content="+vo.getContent() +"where seq="+vo.getSeq());
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getStarting());
			stmt.setString(3, vo.getDestination());
			stmt.setString(4, vo.getTime());		
			stmt.setInt(5, vo.getTimeHour());
			stmt.setInt(6, vo.getTimeMinute());
			stmt.setString(7, vo.getContent());
			stmt.setString(8, vo.getSeq());
			stmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}
		
	}
	public void deleteTaxi(TaxiVO vo)
	{
		String sql = "delete from taxi where seq=?";
		try
		{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getSeq());
			stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt);
		}
	}
	
}
