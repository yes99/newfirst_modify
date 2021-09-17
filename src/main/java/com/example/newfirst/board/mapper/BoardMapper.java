package com.example.newfirst.board.mapper;

import org.springframework.stereotype.Repository;


@Repository("com.example.newfirst.board.mapper.BoardMapper")
public interface BoardMapper {
    public int boardCount() throws Exception;
}
