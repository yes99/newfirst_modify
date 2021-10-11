package com.example.newfirst.board.controller;
import com.example.newfirst.board.domain.BoardVO;
import com.example.newfirst.board.domain.GridVO;
import com.example.newfirst.board.service.BoardService;
import com.example.newfirst.board.service.Criteria;
import com.example.newfirst.board.service.Paging;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.io.FileWriter;
import java.io.IOException;



@Controller   //여기는 컨트롤러 클래스 이다.

public class BoardController {

    @Resource(name="com.example.newfirst.board.service.BoardService")   //이름을 통해서 Bean 객체를 주입
    BoardService mBoardService;

//######################## 컨트롤러 추가중

    /*@RequestMapping(value="/board.do",method= {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public GridVO jqlist(GridVO vo , Criteria cri,  Model model) throws Exception {
        int boardListCnt =mBoardService.boardCount();   // 전체 게시글 수가 몇개인지
        GridVO vvo = new GridVO();
        Paging paging = new Paging(); // 페이징 객체
        paging.setCri(cri); // 기준점 설정
        paging.setTotalCount(boardListCnt); //페이징에서 전체의 게시글 갯수를 카운트함
        int ttotal = paging.getTotalCount();
        //String count = Integer.toString( boardListCnt );
        vvo.setPage("1");
        vvo.setRecords(ttotal);
        vvo.setTotal("3");

        List<BoardVO> dataList = mBoardService.getListService();
        vvo.setRows(dataList);
      //List<GridVO> gridList = vvo;

        System.out.println("똑바로 넘기기는 했니?");
        model.addAttribute("list",dataList);
        model.addAttribute("list",vo);
        return vvo;
    }
*/

    @RequestMapping(value="/board.do",method= {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<BoardVO> jqlist(BoardVO vo , Model model) throws Exception {
        List<BoardVO> dataList = mBoardService.getListService();
        System.out.println("똑바로 넘기기는 했니?");
        model.addAttribute("list",dataList);
        return dataList;
    }





    // 데이터를 view에 매핑
    // http://localhost:8180/test
    @RequestMapping(value="/test",method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView test(ModelAndView mav){
        System.out.println("웃기지 마요 제발");
        mav.setViewName("test"); // view 지정

        return mav;
    }


/*
    @RequestMapping(value="/test",method={RequestMethod.GET, RequestMethod.POST} ) //게시판 리스트 화면 호출
    private String newboardList(Model model) throws Exception{

        //model.addAttribute ::" 앞에 이름을 " 통해 viwecode 쪽에 value를 넘겨줌    Model에 데이터를 담을때 사용
        model.addAttribute("klist", mBoardService.getListService());

        return "test"; //생성할 jsp
    }
*/
//######################## 컨트롤러 추가중


//throws는 예외가 발생하는 메소드를 호출한 메소드안에서 try~catch문을 작성해준다 라고 생각할 수 있다./*

    @RequestMapping("/tmp" ) //게시판 리스트 화면 호출
    private String boardList(Criteria cri, Model model) throws Exception{

        int boardListCnt =mBoardService.boardCount();   // 전체 게시글 수가 몇개인지
        Paging paging = new Paging(); // 페이징 객체
        paging.setCri(cri); // 기준점 설정
        paging.setTotalCount(boardListCnt); //페이징에서 전체의 게시글 갯수를 카운트함

        //model.addAttribute ::" 앞에 이름을 " 통해 viwecode 쪽에 value를 넘겨줌    Model에 데이터를 담을때 사용
        model.addAttribute("tmp", mBoardService.boardListService(cri));
        System.out.println("너는 양심상 제대로 넘기겠지");
        model.addAttribute("paging", paging);

        return "tmp"; //생성할 jsp
    }



    @RequestMapping("/detail/{id}") // 어떤 url에 연결하면 밑의 메소드가 처리한다. 맵핑
    private String boardDetail(@PathVariable int id, Model model) throws Exception{

        model.addAttribute("detail", mBoardService.boardDetailService(id));

        return "detail";
    }



    @RequestMapping("/insert") //게시글 작성폼 호출   현재 tmp 페이지 체제에서는 필요 없음
    private String boardInsertForm(){
        System.out.println("인서트폼을 불러왓습니다");
        return "insert";
    }


    @RequestMapping("/insertProc")   // 인서트를 넘겨주는 페이지
    private String boardInsertProc(HttpServletRequest request) throws Exception{
        //HttpServletRequest 객체를 컨트로럴 메서드의 파라미터로 전달받아 세션 처리
        /*
        HttpServletRequest를 사용하면,  값을 받아올 수 있다.
        예를들어, 아이디, 비밀번호 등의 데이터를 컨트롤러로 보냈을때,
        HttpServletRequest 객체안에 모든 데이터들이 들어가게 된다.

        id와 pwd를 HttpServletRquest 객체를 통해 받아오고,
        Model 객체를 이용해서 뷰로 값을 넘기고 있다.
         */
        System.out.println("이거는 언제 쓰인느걸까?");
        BoardVO board = new BoardVO();

        board.setDate(request.getParameter("date"));
        board.setTitle(request.getParameter("title"));
        board.setAssign(request.getParameter("assign"));
        board.setPerform(request.getParameter("perform"));
        board.setFail(request.getParameter("fail"));

        mBoardService.boardInsertService(board);

        System.out.println("넘겨줄때 쓰는거라고 생각하면 되나");
        return "redirect:/tmp";
    }

    @RequestMapping("/update/{id}") //게시글 수정폼 호출
    private String boardUpdateForm(@PathVariable int id, Model model) throws Exception{
        System.out.println("boardupdateform");
        System.out.println("업데이트폼을 불러왓습니다");

        model.addAttribute("detail", mBoardService.boardDetailService(id));

        return "update";
    }



    @RequestMapping("/updateProc")
    private String boardUpdateProc(HttpServletRequest request) throws Exception{

        System.out.println("board update proc 111");
        BoardVO board = new BoardVO();

        board.setDate(request.getParameter("date"));
        board.setTitle(request.getParameter("title"));
        board.setAssign(request.getParameter("assign"));
        board.setPerform(request.getParameter("perform"));
        board.setFail(request.getParameter("fail"));
        board.setId(Integer.parseInt(request.getParameter("id")));  // 이거 없으니까 수정 안됨

        mBoardService.boardUpdateService(board);
        System.out.println("board update proc 222");

        return "redirect:/detail/"+request.getParameter("id");
    }

    // method parameter 앞에 사용하면서 해당 URL에서 {특정값}을 변수로 받아 올 수 있다.
    @RequestMapping("/delete/{id}")
    private String boardDelete(@PathVariable int id) throws Exception{

        mBoardService.boardDeleteService(id);

        return "redirect:/tmp";
    }


/*    @RequestMapping("/tmp") //게시판 리스트 화면 호출
    private String searchList(Criteria cri, Model model) throws Exception{

        int boardListCnt =mBoardService.boardCount();   // 전체 게시글 수가 몇개인지


        Paging paging = new Paging(); // 페이징 객체
        paging.setCri(cri); // 기준점 설정
        paging.setTotalCount(boardListCnt); //페이징에서 전체의 게시글 갯수를 카운트함

        //model.addAttribute :: Model에 데이터를 담을때 사용
        model.addAttribute("tmp", mBoardService.boardListService(cri));
        model.addAttribute("paging", paging);

        return "tmp"; //생성할 jsp
    }

*/
}
