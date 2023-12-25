package Servlet.Api;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/kosdaqday.do")
public class KosdaqDay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String basDd = request.getParameter("day") != null ? request.getParameter("day") : "20230615";
        // KRX API 호출을 위한 URL, 인증키, 기준일자 설정
        String url = "http://data-dbg.krx.co.kr/svc/apis/sto/ksq_bydd_trd";
        String authKey = "0CC858FDC3EE4C11857C1C67CC49F09EE41D0B4C";

        List<StringBuffer> iSU_NM = new ArrayList<>();
        List<StringBuffer> tDD_CLSPRC = new ArrayList<>();
        List<StringBuffer> cMPPREVDD_PRC = new ArrayList<>();
        List<StringBuffer> fLUC_RT = new ArrayList<>();
        List<Long> mKTCAP = new ArrayList<>();

        // API 요청 보내기
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

        // 응답 처리
        int statusCode = apiResponse.statusCode(); // API 응답 코드
        String responseBody = apiResponse.body(); // API 응답 데이터
        
        ObjectMapper objectMapper = new ObjectMapper();
        
        JsonNode jsonNode = objectMapper.readTree(responseBody);
        JsonNode outBlock1 = jsonNode.get("OutBlock_1");
        if (outBlock1.isArray()) {
            for (JsonNode object : outBlock1) {
                StringBuffer ISU_NM = new StringBuffer(object.get("ISU_NM").asText());
                iSU_NM.add(ISU_NM);
                
                StringBuffer TDD_CLSPRC = new StringBuffer(object.get("TDD_CLSPRC").asText());
                tDD_CLSPRC.add(TDD_CLSPRC);
                
                StringBuffer CMPPREVDD_PRC = new StringBuffer(object.get("CMPPREVDD_PRC").asText());
                cMPPREVDD_PRC.add(CMPPREVDD_PRC);
                
                StringBuffer FLUC_RT = new StringBuffer(object.get("FLUC_RT").asText());
                fLUC_RT.add(FLUC_RT);
                
                Long MKTCAP = new Long(object.get("MKTCAP").asText());
                mKTCAP.add(MKTCAP);
            }
        }
        
        // mKTCAP 값을 기준으로 내림차순으로 정렬
        List<Stock> stocks = new ArrayList<>();
        for (int i = 0; i < mKTCAP.size(); i++) {
            stocks.add(new Stock(iSU_NM.get(i), tDD_CLSPRC.get(i), cMPPREVDD_PRC.get(i), fLUC_RT.get(i), mKTCAP.get(i)));
        }
        stocks.sort(Comparator.comparing(Stock::getMKTCAP).reversed());
        
        // 상위 10개 종목만 선택
        List<StringBuffer> selectedISU_NM = new ArrayList<>();
        List<StringBuffer> selectedTDD_CLSPRC = new ArrayList<>();
        List<StringBuffer> selectedCMPPREVDD_PRC = new ArrayList<>();
        List<StringBuffer> selectedFLUC_RT = new ArrayList<>();
        List<Long> selectedMKTCAP = new ArrayList<>();
        int count = Math.min(stocks.size(), 10);
        for (int i = 0; i < count; i++) {
            selectedISU_NM.add(stocks.get(i).getISU_NM());
            selectedTDD_CLSPRC.add(stocks.get(i).getTDD_CLSPRC());
            selectedCMPPREVDD_PRC.add(stocks.get(i).getCMPPREVDD_PRC());
            selectedFLUC_RT.add(stocks.get(i).getFLUC_RT());
            selectedMKTCAP.add(stocks.get(i).getMKTCAP());
        }
        
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("basDd2", basDd);
        request.setAttribute("iSU_NM2", selectedISU_NM);
        request.setAttribute("tDD_CLSPRC2", selectedTDD_CLSPRC);
        request.setAttribute("cMPPREVDD_PRC2", selectedCMPPREVDD_PRC);
        request.setAttribute("fLUC_RT2", selectedFLUC_RT);
        request.setAttribute("mKTCAP2", selectedMKTCAP);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
        dispatcher.forward(request, response);
    }
}

class Stock {
    private StringBuffer ISU_NM;
    private StringBuffer TDD_CLSPRC;
    private StringBuffer CMPPREVDD_PRC;
    private StringBuffer FLUC_RT;
    private Long MKTCAP;
    
    public Stock(StringBuffer ISU_NM, StringBuffer TDD_CLSPRC, StringBuffer CMPPREVDD_PRC, StringBuffer FLUC_RT, Long MKTCAP) {
        this.ISU_NM = ISU_NM;
        this.TDD_CLSPRC = TDD_CLSPRC;
        this.CMPPREVDD_PRC = CMPPREVDD_PRC;
        this.FLUC_RT = FLUC_RT;
        this.MKTCAP = MKTCAP;
    }
    
    public StringBuffer getISU_NM() {
        return ISU_NM;
    }
    
    public StringBuffer getTDD_CLSPRC() {
        return TDD_CLSPRC;
    }
    
    public StringBuffer getCMPPREVDD_PRC() {
        return CMPPREVDD_PRC;
    }
    
    public StringBuffer getFLUC_RT() {
        return FLUC_RT;
    }
    
    public Long getMKTCAP() {
        return MKTCAP;
    }
}
