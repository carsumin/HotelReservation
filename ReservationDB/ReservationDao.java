package ReservationDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import ReservationDB.ReservationDo;

public class ReservationDao {
	
		// MySQL DB 연동 시작 !!
		String id = "root";
		String pass = "111111";
		
		//jdbc:mysql://localhost:3306/jspdb<--db명
		String url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf-8";
		
		Connection con = null; //DB 연결
		PreparedStatement pstmt = null; //SQL 문 구성
		ResultSet rs = null; //SQL문 실행 결과 처리
		
		public void connect_cp(){
				
			try {
				//컨텍스트 객체 생성
				Context initctx = new InitialContext();
				
				//context.xml 기반의 환경설정 객체 접근 객체변수 설정
				Context envctx = (Context) initctx.lookup("java:/comp/env");
				
				//커넥션 풀에 접근
				DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
				
				//db 연결
				con = ds.getConnection();
				
				System.out.println("커넥션 풀을 이용하여 데이터베이스 연결 성공!!");
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//데이터베이스 연결
		public void connect(){
			
			try{
				//드라이버 로드
				Class.forName("com.mysql.jdbc.Driver");
				
				//DB 연결
				con = (Connection) DriverManager.getConnection(url, id, pass);
			
				System.out.println("MYSQL 연결 성공");
			} catch (Exception e){
				e.printStackTrace();
			}
		}
		
		//데이터베이스 연결 해제
		public void disConnect(){
		if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pstmt != null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
		
	public void insertReservation(ReservationDo aDo){
		//1. 디비 연결
		connect_cp();
		
		//2. sql 처리
		//SQL 구성
		String sql = "insert into reservation (name,tel,email,adult,child,room,checkin,checkout)" + "values(?,?,?,?,?,?,?,?)";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aDo.getName());
			pstmt.setString(2, aDo.getTel());
			pstmt.setString(3, aDo.getEmail());
			pstmt.setString(4, aDo.getAdult());
			pstmt.setString(5, aDo.getChild());
			pstmt.setString(6, aDo.getRoom());
			pstmt.setString(7, aDo.getCheckin());
			pstmt.setString(8, aDo.getCheckout());
			
			//SQL 설정
			pstmt.executeUpdate();
			System.out.println("insertReservation(ReservationDo aDo) 데이터베이스 처리 완료");
		} catch (SQLException e){
			e.printStackTrace();
		}
		//3. 디비연결 해제
		disConnect();
	}
	
	public ArrayList<ReservationDo> getAllReservation(String keyField, String keyWord){
		
		//1. 디비 연결
		connect_cp();
		
		//2. SQL문 처리
		ArrayList<ReservationDo> aList = new ArrayList<ReservationDo>();
		String sql = "select * from reservation order by name asc";
		try {
			
			if(keyWord != null && !keyWord.equals("") )
	            sql = "select * from reservation where name like '%"+keyWord.trim()+"%'"; 
			
			pstmt = con.prepareStatement(sql);
			
			//3. 실행
			rs = pstmt.executeQuery(sql); //SQL 처리 결과 rs에 리턴	
			
			while(rs.next()){
				ReservationDo aDo = new ReservationDo();
				
				aDo.setNum(rs.getInt(1));//num
				aDo.setName(rs.getString(2));//name
				aDo.setTel(rs.getString(3));//tel
				aDo.setEmail(rs.getString(4));//email
				aDo.setAdult(rs.getString(5));//adult
				aDo.setChild(rs.getString(6));//child
				aDo.setRoom(rs.getString(7));//room
				aDo.setCheckin(rs.getString(8));//checkin
				aDo.setCheckout(rs.getString(9));//checkout
				
				aList.add(aDo);
				
				System.out.println("getAllReservation() 처리 완료!!!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
	}
		//3. 디비연결 해제
		disConnect();
		
		return aList;
	}
	
	public ReservationDo getReservationOne(int num){
		System.out.println("getReservationOne() 처리 시작");
		connect_cp();
		
		ReservationDo aDo = new ReservationDo();
		
		try {
			String sql = "select * from reservation where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				aDo.setNum(rs.getInt(1));//num
				aDo.setName(rs.getString(2));//name
				aDo.setTel(rs.getString(3));//tel
				aDo.setEmail(rs.getString(4));//email
				aDo.setAdult(rs.getString(5));//adult
				aDo.setChild(rs.getString(6));//child
				aDo.setRoom(rs.getString(7));//room
				aDo.setCheckin(rs.getString(8));//checkin
				aDo.setCheckout(rs.getString(9));//checkout
				
			}
			
			disConnect();
			System.out.println("getReservationOne() 처리 완료");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aDo;
		
}	
		
	public void modifyReservation(ReservationDo aDo){
		System.out.println("modifyReservation() 처리 시작");
		connect_cp();
		
		String sql = "update reservation set name=?, tel=?, email=?, adult=?, child=?, room=?, checkin=?, checkout=?" + "where num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aDo.getName());
			pstmt.setString(2, aDo.getTel());
			pstmt.setString(3, aDo.getEmail());
			pstmt.setString(4, aDo.getAdult());
			pstmt.setString(5, aDo.getChild());
			pstmt.setString(6, aDo.getRoom());
			pstmt.setString(7, aDo.getCheckin());
			pstmt.setString(8, aDo.getCheckout());
			pstmt.setInt(9, aDo.getNum());			
			pstmt.executeUpdate();
			
			disConnect();
			System.out.println("modifyReservation() 처리 완료");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	public void deleteReservation(int num){
		System.out.println("deleteReservation() 처리 시작");
		connect_cp();
		
		try {
			String sql = "delete from reservation where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			disConnect();
			System.out.println("deleteReservation() 처리 완료");
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
