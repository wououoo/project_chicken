package com.project.kammi.controller.board;


import com.project.kammi.domain.board.Board;
import com.project.kammi.repository.BoardRowMapper;
import com.project.kammi.repository.IBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository implements IBoardRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Board> findAll() {
        String query = "SELECT * FROM board ORDER BY id DESC";

        return jdbcTemplate.query(query, new BoardRowMapper());
    }

    /////////////////////////////////1. 수정조회///////////////////////////////////
    @Override
    public Board findById(int id) {

        String query = "SELECT * FROM board WHERE id = ?";
        return jdbcTemplate.queryForObject(query, new Object[]{id}, new BoardRowMapper());
    }
//////////////////////////////////////////////////////////////////////////////

    @Override
    public void save(Board board) {
        String query = "INSERT INTO board (id, title, content, author) VALUES (board_seq.nextval, ?, ?, ?)";
        jdbcTemplate.update(query, board.getTitle(), board.getContent(), board.getAuthor());
    }

    ///////////////////////////////2. 수정실행/////////////////////////////
    @Override
    public void update(Board board) {

        System.out.println("===================값 콘솔확인==================");
        System.out.println("id: " + board.getId());
        System.out.println("title: " + board.getTitle());
        System.out.println("content: " + board.getContent());
        System.out.println("author: " + board.getAuthor());
        System.out.println("run: " + board.getRun());
        System.out.println("ready: " + board.getReady());
        System.out.println("complete: " + board.getComplete());
        System.out.println("==============================================");

        String query = "UPDATE board SET title = ?, content = ?, author = ? WHERE id = ?";
        jdbcTemplate.update(query, board.getTitle(), board.getContent(), board.getAuthor(), board.getId());
    }
    //////////////////////////////////////////////////////////////////////
    @Override
    public void delete(int id) {

        String query = "DELETE FROM board WHERE id = ?";
        jdbcTemplate.update(query, id);
    }
}

