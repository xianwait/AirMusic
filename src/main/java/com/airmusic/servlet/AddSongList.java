package com.airmusic.servlet;

import com.airmusic.entity.SongList;
import com.airmusic.service.impl.AirMusicServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddSongList")
public class AddSongList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        SongList songList = new SongList();

        songList.setmName(request.getParameter("mName"));
        songList.setmCreateName(Integer.parseInt(request.getParameter("mCreateName")));
        AirMusicServiceImpl airMusicService = new AirMusicServiceImpl();
         int result =  airMusicService.addSongListService(songList);
        PrintWriter out = response.getWriter();
        out .print(result);
    }
}
