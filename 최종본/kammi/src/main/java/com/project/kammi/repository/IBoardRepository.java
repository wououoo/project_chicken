package com.project.kammi.repository;

import com.project.kammi.domain.board.Board;

import java.util.List;

public interface IBoardRepository {
    List<Board> findAll();                  // 1. 게시판 전체 목록 조회_240420
    Board findById(int id);
    void save(Board board);                 // 2. 게시판 등록_240420
    void update(Board board);
    void delete(int id);
}
