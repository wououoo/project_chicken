package com.project.kammi.controller.board;


import com.project.kammi.domain.board.Board;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardRepository boardRepository;

	private JdbcTemplate jdbcTemplate; // 2024-04-18 신규 추가

	public BoardController(JdbcTemplate jdbcTemplate) { //  2024-04-18 신규 추가
		this.jdbcTemplate = jdbcTemplate; //  2024-04-18 신규 추가
	}

	@GetMapping
	public String list(Model model) {


		model.addAttribute("boards", boardRepository.findAll());

		return "/board/list";
	}

	@GetMapping("/{id}")
	public String detail(@PathVariable int id, Model model) {
		Board board;

		board = boardRepository.findById(id);

		model.addAttribute("board", board);

		return "/board/detail";
	}


	@GetMapping("/new")
	public String newBoardForm() {

		return "/board/new";
	}

	@PostMapping("/new")
	public String newBoard(HttpServletRequest request) {

		String title;
		String content;
		String author;
		String notification;
		Board board;
		String selectedValue = null;

		System.out.println("==========================================================");
		System.out.println("ready value = " + request.getParameter("ready"));
		System.out.println("run value = " + request.getParameter("run"));
		System.out.println("complete value = " + request.getParameter("complete"));
		System.out.println("notification value = " + request.getParameter("notification"));
		System.out.println("title value = " + request.getParameter("title"));
		System.out.println("==========================================================");

		// 셀렉트 박스의 값 가져오기
		selectedValue = request.getParameter("title");

		// 셀렉트 박스의 값에 따라 title 변수 설정
		switch (selectedValue) {
			case "ready":
				title = "요청";
				break;
			case "run":
				title = "진행";
				break;
			case "complete":
				title = "완료";
				break;
			case "notification":
				title = "공지";
				break;
			default:
				title = "none";
				break;
		}

		notification = request.getParameter("notification");
		content = request.getParameter("content");
		author = request.getParameter("author");

		board = new Board();

		board.setTitle(title);
		board.setNotification(notification);
		board.setContent(content);
		board.setAuthor(author);

		boardRepository.save(board);

		return "redirect:/board";
	}


	////////////////////////1. 수정조회////////////////////////
	@GetMapping("/edit/{id}")
	public String editForm(@PathVariable int id, Model model) {

		Board board;

		board = boardRepository.findById(id);

		model.addAttribute("board", board);

		return "/board/edit";
	}
	//////////////////////////////////////////////////////////
	////////////////////////2. 수정실행/////////////////////////
	@PostMapping("/update")
	public String update(HttpServletRequest request) {
		int id;
		String title;
		String content;
		String author;
		String notification;
		Board board;
		String selectedValue = null;

		System.out.println("==========================================================");
		System.out.println("ready value = " + request.getParameter("ready"));
		System.out.println("run value = " + request.getParameter("run"));
		System.out.println("complete value = " + request.getParameter("complete"));
		System.out.println("notification value = " + request.getParameter("notification"));
		System.out.println("title value = " + request.getParameter("title"));
		System.out.println("==========================================================");

		// 셀렉트 박스의 값 가져오기
		selectedValue = request.getParameter("title");

		// 셀렉트 박스의 값에 따라 title 변수 설정
		switch (selectedValue) {
			case "ready":
				title = "요청";
				break;
			case "run":
				title = "진행";
				break;
			case "complete":
				title = "완료";
				break;
			case "notification":
				title = "공지";
				break;
			default:
				title = "none";
				break;
		}

		id = Integer.parseInt(request.getParameter("id"));
		content = request.getParameter("content");
		author = request.getParameter("author");
		notification = request.getParameter("notification");
		board = new Board();

		board.setId(id);
		board.setTitle(title); // title 변수에 설정한 값을 사용
		board.setContent(content);
		board.setAuthor(author);
		board.setNotification(notification);
		boardRepository.update(board);

		return "redirect:/board";
	}

	@PostMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		boardRepository.delete(id);
		return "redirect:/board";
	}

	@GetMapping("/error")
	public String handleError(HttpServletRequest request) {

		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		// error로 들어온 에러의 status를 불러온다 (ex:404,500,403...)

		if(status != null){
			int statusCode = Integer.valueOf(status.toString());

			if(statusCode == HttpStatus.NOT_FOUND.value()) {
				return "404";
			} else {
				return "error";
			}
		}

		return "/board/error";
	}

}
