package com.airmusic.service.impl;

import com.airmusic.dao.impl.AirMusciDaoImpl;
import com.airmusic.entity.SongList;
import com.airmusic.service.AirMusicService;

public class AirMusicServiceImpl implements AirMusicService {
    AirMusciDaoImpl airMusciDaoImpl = new AirMusciDaoImpl();
    @Override
    public int addSongListService(SongList songList) {
        return airMusciDaoImpl.addSongList(songList);
    }

    @Override
    public int deleteSongListService(SongList songList) {
        return airMusciDaoImpl.deleteSongList(songList);
    }
}
