package services;

import java.awt.image.RescaleOp;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DBAccess
 */
@WebServlet("/DBAccess")
public class DBAccess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DBAccess() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	//doGet Method zum GET-Request
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//get function parameter
		String function = request.getParameter("function");
		String success = "NO";

		//get request parameters 
		if (function.equals("addUser")) {
			if (addUser(request.getParameter("vorname"),
					request.getParameter("nachname"),
					request.getParameter("password"), 0,
					request.getParameter("klasse")).equals("true")) {
				success = "YES!!!";
			} else {
				success = addUser(request.getParameter("vorname"),
						request.getParameter("nachname"),
						request.getParameter("password"), 0,
						request.getParameter("klasse"));
			}
		}

		response.setContentType("text/html");
		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("done " + request.getParameter("vorname")
				+ request.getParameter("nachname")
				+ request.getParameter("password") + "0"
				+ request.getParameter("klasse") + success);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	//method to add a new user
	public String addUser(String vorname, String name, String password,
			int adminrights, String iclass) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			try {
				Connection connection = DriverManager
						.getConnection("jdbc:mysql://127.0.0.1/sport?user=root&password=");
				PreparedStatement stm = connection
						.prepareStatement("INSERT INTO user (name, lastname, password, adminrights, class, email) VALUES (?, ?, ?, ?, ?, ?) ");
				stm.setString(1, vorname);
				stm.setString(2, name);
				stm.setString(3, password);
				stm.setInt(4, adminrights);
				stm.setString(5, iclass);
				stm.setString(6, "def_adre");
				stm.executeUpdate();

				return "true";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				return e.getMessage();
			}
		} catch (Exception e) {
			return "false";
		}
	}

	//done via PHP... 
	public boolean checkLogon(String vorname, String nachname, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://127.0.0.1/sport?user=root&password=");
			PreparedStatement stm = connection
					.prepareStatement("SELECT password from user where name = ? AND lastname = ?");
			stm.setString(1, vorname);
			stm.setString(2, nachname);

			ResultSet abcd = stm.executeQuery();
			String db_password = null;
			while (abcd.next()) {
				db_password = abcd.getString("password");
				break;
			}
			if (db_password.equals(password)) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
	}

	public int getTime(int userid, String competition) {
		return 0;
	}
}