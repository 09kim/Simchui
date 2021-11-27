package member;

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

public class MemberDAO {
	
	// 디비연결 메서드()
	public Connection getConnect() throws Exception{
				// 1단계 드라이버 불러오기
//				Class.forName("com.mysql.jdbc.Driver");
//				// 2단계 디비연결
//				String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
//				String dbUser = "jspid";
//				String dbPass = "jsppass";
//				Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//				return con;
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	}
	
	
	// insertMember(자바빈주소)
	public void insertMember(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 예외발생 할 명령
			con = getConnect();
			// 3단계 sql
			String sql = "insert into member(id,pass,name,reg_date,email,address,phone,mobile,address2,address3,address4) values(?,?,?,?,?,?,?,?,?,?,?)";
		    pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setTimestamp(4, mb.getReg_date());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getAddress());
			pstmt.setString(7, mb.getPhone());
			pstmt.setString(8, mb.getMobile());
			pstmt.setString(9, mb.getAddress2());
			pstmt.setString(10, mb.getAddress3());
			pstmt.setString(11, mb.getAddress4());
			// 4단계 실행
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("기억장소 정리하는 마무리 작업");
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
		}
	}// insertMember()

	// getMember(id)
	public MemberBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean mb = new MemberBean();
//		select * from member where id='kim';
		// id | pass | name | reg_date
		// kim | 1111 | 김길동 | 2020-06-11 15:36:44
		// MemberBean 안에 id | pass | name | reg_date 저장해서 리턴
//		mb.setId(디비에서 가져온 id);
		try {
			// 1단계 드라이버 불러오기
			con = getConnect();
			// sql select id에 해당하는 회원정보 가져오기
			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계 실행 결과 => ResultSet rs
			rs = pstmt.executeQuery();
			// if rs에 처음위치에서 다음행으로 이동 데이터가 있으면 True
			// 출력 아이디 : 비밀번호 : 이름 : 가입날짜:
			if (rs.next()) {
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				mb.setAddress(rs.getString("address"));
				mb.setMobile(rs.getString("mobile"));
				mb.setPhone(rs.getString("phone"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			}
//			 	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
		}

		return mb;
	}
	
	
	
	public boolean idCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = true;

		try {
			con = getConnect();

			String sql = "select id from member where id = ?";

			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			pstmt = con.prepareStatement(sql); // SQL 구문을 저장
			pstmt.setString(1, id);

			// 4단계 실행결과 => ResultSet rs
			rs = pstmt.executeQuery();

			if (rs.next()) { // rs.next() 는 값이 true면 실행하는것
				check = true;
			} else {
				check = false;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
		}

		return check;

	}
	
	public boolean emailCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = true;

		try {
			con = getConnect();

			String sql = "select email from member where email = ?";

			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			pstmt = con.prepareStatement(sql); // SQL 구문을 저장
			pstmt.setString(1, id);

			// 4단계 실행결과 => ResultSet rs
			rs = pstmt.executeQuery();

			if (rs.next()) { // rs.next() 는 값이 true면 실행하는것
				check = true;
			} else {
				check = false;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
		}

		return check;

	}
	

	public int userCheck(String id, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;

		try {
			con = getConnect();

			String sql = "select * from member where id=?";

			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			pstmt = con.prepareStatement(sql); // SQL 구문을 저장
			pstmt.setString(1, id);

			// 4단계 실행결과 => ResultSet rs
			rs = pstmt.executeQuery();

			if (rs.next()) { // rs.next() 는 값이 true면 실행하는것

				if (rs.getString("pass").equals(pass)) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
		}

		return check;

	}

	public void updateMember(MemberBean mb) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = getConnect();

			String sql = "update member set name = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getId());
			pstmt.executeUpdate();
			
			sql = "update member set email = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail());
			pstmt.setString(2, mb.getId());
			pstmt.executeUpdate();
			
			sql = "update member set address = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getAddress());
			pstmt.setString(2, mb.getId());
			pstmt.executeUpdate();
			
			sql = "update member set phone = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getPhone());
			pstmt.setString(2, mb.getId());
			pstmt.executeUpdate();
			
			sql = "update member set mobile = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getMobile());
			pstmt.setString(2, mb.getId());
			pstmt.executeUpdate();
			
			sql = "update member set address2 = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getAddress2());
			pstmt.setString(2, mb.getId());
			pstmt.executeUpdate();
			
			sql = "update member set address3 = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getAddress3());
			pstmt.setString(2, mb.getId());
			pstmt.executeUpdate();
			
			sql = "update member set address4 = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getAddress4());
			pstmt.setString(2, mb.getId());
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
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
		}

	}

	public void deleteMember(MemberBean id) { // String id 하나만 받아와서 써도됨
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnect();

			String sql = "delete from member where id = ?";

			pstmt = con.prepareStatement(sql); // SQL 구문을 저장
			pstmt.setString(1, id.getId());

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
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
		}
	}
	
	public List getMemberList() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List memberList = new ArrayList();
		
//		select * from member where id='kim';
		// id | pass | name | reg_date
		// kim | 1111 | 김길동 | 2020-06-11 15:36:44
		// MemberBean 안에 id | pass | name | reg_date 저장해서 리턴
//		mb.setId(디비에서 가져온 id);
		try {
			con = getConnect();
			// sql select id에 해당하는 회원정보 가져오기
			// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			// 4단계 실행 결과 => ResultSet rs
			rs = pstmt.executeQuery();
			// while rs에 처음위치에서 다음행으로 이동 데이터가 있으면 True
			// 출력 아이디 : 비밀번호 : 이름 : 가입날짜:
			while(rs.next()) { 
				MemberBean mb = new MemberBean();  // 안에 써야 여러개 저장가능함 밖에 선언하면 주소값은 하나고 저장장소만 달라져서 결국 마지막에 하나만 저장됨
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				// 배열 한칸에 한사람의 정보 주소를 저장
				memberList.add(mb);
			}
//			 	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
			if(rs != null) try {rs.close();} catch (SQLException ex) {}
		}

		return memberList;
	}
	
public void changePass(MemberBean mb) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = getConnect();

			String sql = "update member set pass = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getPass());
			pstmt.setString(2, mb.getId());
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
			if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
			if(con != null) try {con.close();} catch (SQLException ex) {}
		}

	}

}
// 클래스
