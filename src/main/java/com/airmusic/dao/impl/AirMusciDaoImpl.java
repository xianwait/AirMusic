package com.airmusic.dao.impl;

import com.airmusic.dao.AirMusicDao;
import com.airmusic.dao.BaseMapper;
import com.airmusic.entity.SongList;

public class AirMusciDaoImpl implements AirMusicDao {
    @Override
    public int addSongList(SongList songList) {

        int result = 0;

        BaseMapper.getMapperAgency().addSongListger(songList);
        result = songList.getmId();
        BaseMapper.commit();

        if(result>0){
            BaseMapper.closeSession();
            return result;
        }else{
            BaseMapper.closeSession();
        }
        return result;
    }

    @Override
    public int deleteSongList(SongList songList) {
        int result = 0;
        result = BaseMapper.getMapperAgency().deleteSongList(songList);
        BaseMapper.commit();

        if(result>0){
            BaseMapper.closeSession();
            return result;
        }else{
            BaseMapper.closeSession();
        }
        return result;
    }

}
