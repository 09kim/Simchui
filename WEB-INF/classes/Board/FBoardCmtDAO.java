package Board;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FBoardCmtDAO {
	
	
	public Connection getConnect() throws Exception{
		// 1단계 드라이버 불러오기
//		Class.forName("com.mysql.jdbc.Driver");
//		// 2단계 디비연결
//		String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
//		String dbUser = "jspid";
//		String dbPass = "jsppass";
//		Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con;
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
}
	
	public void insertFBoard(BoardBean bb){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

			// 1단계 드라이버 로더
			try {
				con = getConnect();
			
				// num 게시판 글번호 구하기 => 게시판 글번호 중에 가장 큰 번호를 구해와서 +1
				// 3단계 max(num) sql
				// select * from board; => Empty set (0.00 sec)
				// select num from board; Empty set (0.00 sec)
				// select max(num) from board;
				int num = 0;
				String sql = "select max(num) from boardcmt";
				pstmt = con.prepareStatement(sql);

				// 4단계 실행
				rs = pstmt.executeQuery();

				// 5단계 첫행(다음행)으로 이동 데이터 있으면 rs에서 max(num)+1 가져와서 num 저장
				if(rs.next()){
					num = rs.getInt("max(num)")+1;
				}

				// 3단계 sql insert
				// 데이터베이스 board file 열 추가
				sql = "insert into boardcmt(num,name,content,date) values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3, bb.getPass());
				
				pstmt.setString(5, bb.getContent());
				
				pstmt.setTimestamp(7, bb.getDate());
				// file 추가
				
				// 4단계 실행
				pstmt.executeUpdate();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if(rs != null) try {rs.close();} catch (SQLException ex) {}
				if(con != null) try {con.close();} catch (SQLException ex) {}
				if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			}
	}
	
public void insertBoard(BoardBean bb){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

			// 1단계 드라이버 로더
			try {
				con = getConnect();
			
				// num 게시판 글번호 구하기 => 게시판 글번호 중에 가장 큰 번호를 구해와서 +1
				// 3단계 max(num) sql
				// select * from board; => Empty set (0.00 sec)
				// select num from board; Empty set (0.00 sec)
				// select max(num) from board;


				// 3단계 sql insert
				// 데이터베이스 board file 열 추가
				String sql = "insert into fboardcmt(num,name,content,date) values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				pstmt.setString(2, bb.getName());
				
				
				pstmt.setString(3, bb.getContent());
				
				pstmt.setTimestamp(4, bb.getDate());
				// file 추가
				
				// 4단계 실행
				pstmt.executeUpdate();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if(rs != null) try {rs.close();} catch (SQLException ex) {}
				if(con != null) try {con.close();} catch (SQLException ex) {}
				if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			}
	}
	
	public List<BoardBean> getBoardList(int startRow, int pageRow, int num) {
		
		List<BoardBean> boardList = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnect();
			// 1단계 드라이버 불러오기

			// 3단계 sql select 게시판 모든 글 가져오기 , num 기준으로 내림차순(최신글)
//			String sql = "select * from board order by num desc";
//			String sql = "select * from board order by num desc limit 시작행-1, 개수";
			String sql = "select * from fboardcmt where num = ? order by num desc limit ?, ?"; // mySQL에 있는 필요한 만큼 가져오는 구문
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageRow); 
			// 4단계 ResultSet rs = 실행 결과 저장 
			rs = pstmt.executeQuery();
			// 5단계 while
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setContent(rs.getString("content"));
				
				boardList.add(bb);
				
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
		}
		return boardList;
		
	}
	
	public BoardBean getContent(int num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean bb = new BoardBean();
		
		try {
			con = getConnect();
			

			// 4단계 실행

			// 3단계 sql select  where num=?
			String sql = "select * from fboardcmt where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			// 4단계 rs = 실행 결과 저장
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				
				bb.setContent(rs.getString("content"));
				bb.setName(rs.getString("name"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setNum(rs.getInt("num"));
				// file 가져오기
			
						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
		}
		return bb;
		
		
	}
	
		
		
		
	
	
	
	
	public void deleteBoard(BoardBean bb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnect();
			String sql= "delete from fboardcmt where date=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setTimestamp(1, bb.getDate());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
		}
		
	}
	
	public void updateBoard(BoardBean bb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = getConnect();
			String sql = "update boardcmt set name = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bb.getName());
			pstmt.setInt(2,bb.getNum());
			pstmt.executeUpdate();
			
			sql = "update boardcmt set subject = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bb.getSubject());
			pstmt.setInt(2,bb.getNum());
			pstmt.executeUpdate();
			sql = "update boardcmt set content = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bb.getContent());
			pstmt.setInt(2,bb.getNum());
			pstmt.executeUpdate();
			sql = "update boardcmt set date = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setTimestamp(1, bb.getDate());
			pstmt.setInt(2,bb.getNum());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
		}
		
	}
	
	public int getBoardCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			
			con = getConnect();
			String sql = "select count(*) from fboardcmt";
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeQuery();
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
		} return count;
	}
	
	
	public int getBoardCount(String search) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			
			con = getConnect();
			String sql = "select count(*) from fboardcmt where subject like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.executeQuery();
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
		} return count;
	}
	
public List<BoardBean> getBoardList(int startRow, int pageRow, String search) {
		
		List<BoardBean> boardList = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnect();
			// 1단계 드라이버 불러오기

			// 3단계 sql select 게시판 모든 글 가져오기 , num 기준으로 내림차순(최신글)
//			String sql = "select * from board order by num desc";
//			String sql = "select * from board order by num desc limit 시작행-1, 개수";
			String sql = "select * from fboardcmt where subject like ? order by num desc limit ?, ?"; // mySQL에 있는 필요한 만큼 가져오는 구문
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageRow); 
			// 4단계 ResultSet rs = 실행 결과 저장 
			rs = pstmt.executeQuery();
			// 5단계 while
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setContent(rs.getString("content"));
				bb.setSubject(rs.getString("subject"));
				
				boardList.add(bb);
				
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
		}
		return boardList;
		
	}
	
	
public int getNum(int num){
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int num2 = 0;
		// 1단계 드라이버 로더
		try {
			con = getConnect();
		
			// num 게시판 글번호 구하기 => 게시판 글번호 중에 가장 큰 번호를 구해와서 +1
			// 3단계 max(num) sql
			// select * from board; => Empty set (0.00 sec)
			// select num from board; Empty set (0.00 sec)
			// select max(num) from board;


			// 3단계 sql insert
			// 데이터베이스 board file 열 추가
			String sql = "select count(num) from fboardcmt where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num2 = rs.getInt(1);
			}
			
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
		}
		
		return num2;
}
	
	
	


}
