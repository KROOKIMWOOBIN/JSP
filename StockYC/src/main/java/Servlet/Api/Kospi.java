package Servlet.Api;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/kospi.do")
public class Kospi extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	String basDd = request.getParameter("day") != null ? request.getParameter("day") : "20230615";
        // KRX API 호출을 위한 URL, 인증키, 기준일자, 필요한 옵션 설정
        String url = "http://data-dbg.krx.co.kr/svc/apis/idx/kospi_dd_trd";
        String authKey = "0CC858FDC3EE4C11857C1C67CC49F09EE41D0B4C";
        
        List<String> iDX_NM = new ArrayList<>();
        List<String> cLSPRC_IDX = new ArrayList<>();
        List<String> cMPPREVDD_IDX = new ArrayList<>();
        List<String> fLUC_RT = new ArrayList<>();
        List<String> aCC_TRDVOL = new ArrayList<>();
        
        HttpClient httpClient = HttpClient.newHttpClient();
        HttpRequest httpRequest = HttpRequest.newBuilder()
                .uri(URI.create(url + "?basDd=" + basDd))
                .header("AUTH_KEY", authKey)
                .build();

        HttpResponse<String> apiResponse = null;
        try {
            apiResponse = httpClient.send(httpRequest, HttpResponse.BodyHandlers.ofString());
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }

        int statusCode = apiResponse.statusCode(); // API 응답 코드
        String responseBody = apiResponse.body(); // API 응답 데이터
        
        ObjectMapper objectMapper = new ObjectMapper();
        
        JsonNode jsonNode = objectMapper.readTree(responseBody);
        JsonNode outBlock1 = jsonNode.get("OutBlock_1");
        if (outBlock1.isArray()) {
            for (JsonNode object : outBlock1) {
                String IDX_NM = object.get("IDX_NM").asText();
                iDX_NM.add(IDX_NM);
                
                String CLSPRC_IDX = object.get("CLSPRC_IDX").asText();
                cLSPRC_IDX.add(CLSPRC_IDX);
                
                String CMPPREVDD_IDX = object.get("CMPPREVDD_IDX").asText();
                cMPPREVDD_IDX.add(CMPPREVDD_IDX);
                
                String FLUC_RT = object.get("FLUC_RT").asText();
                fLUC_RT.add(FLUC_RT);
                
                String ACC_TRDVOL = object.get("ACC_TRDVOL").asText();
                aCC_TRDVOL.add(ACC_TRDVOL);
            }
        }
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("basDd2", basDd);
        request.setAttribute("iDX_NM", iDX_NM);
        request.setAttribute("cLSPRC_IDX", cLSPRC_IDX);
        request.setAttribute("cMPPREVDD_IDX", cMPPREVDD_IDX);
        request.setAttribute("fLUC_RT", fLUC_RT);
        request.setAttribute("aCC_TRDVOL", aCC_TRDVOL);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
        dispatcher.forward(request, response);
    }
}