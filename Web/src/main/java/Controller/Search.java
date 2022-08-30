package Controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import Model.PostDTO;
import Model.PatentDAO;
import Model.PatentDTO;

@WebServlet("/Search")
public class Search extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String abs = request.getParameter("abs");
		String content = request.getParameter("content");
		int ipc = Integer.parseInt(request.getParameter("ipc"));
		String tag = request.getParameter("tag");
		
		
		PostDTO post = new PostDTO(title, abs, content, ipc, tag);
		
		
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("abs", abs);
		jsonobj.put("ipc", ipc);
		
		URL url = new URL("http://172.30.1.49:5000/");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		
		conn.setDoOutput(true);
        conn.setDoInput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept-Charset", "UTF-8");
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(10000);
		
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		writer.write(jsonobj.toString());
		writer.flush();
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		JSONParser parser = new JSONParser();
		
		PatentDAO dao = new PatentDAO();
		ArrayList<PatentDTO> patents = new ArrayList();
		HashMap<Integer, String> IpcMap = new HashMap();
		IpcMap.put(0, "A");
		IpcMap.put(1, "B");
		IpcMap.put(2, "C");
		IpcMap.put(3, "D");
		IpcMap.put(4, "E");
		IpcMap.put(5, "F");
		IpcMap.put(6, "G");
		IpcMap.put(7, "H");
		
		ArrayList<String> nums = new ArrayList();
		try {
			JSONObject recvobj = (JSONObject)parser.parse(new InputStreamReader(conn.getInputStream()));
			JSONArray indexes = (JSONArray)recvobj.get("index");
			JSONArray scores = (JSONArray)recvobj.get("score");
			
			for (int i=0; i<indexes.size(); i++) {
				PatentDTO patent = new PatentDTO();
				patent.setNum(indexes.get(i).toString());
				nums.add(indexes.get(i).toString());
				patent.setSim(Float.parseFloat(scores.get(i).toString()));
				String[] info = dao.getInfo(indexes.get(i).toString());
				patent.setIpc(info[0]);
				patent.setTitle(info[1]);
				patent.setAbs(info[2]);
				patents.add(patent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		post.setPatents(patents);
		
		session.setAttribute("patent", patents);
		
		if (request.getParameter("index") == null) {
			session.setAttribute("post", post);
			response.sendRedirect("Post.jsp");
		}
		
		else {
			int index = Integer.parseInt(request.getParameter("index"));
			PostDTO ex_post = (PostDTO)session.getAttribute("detail_post");
			post.setNum(ex_post.getNum());
			session.setAttribute("detail_post", post);
			response.sendRedirect("EditPost.jsp?index=" + Integer.toString(index));
		}
	}

}
