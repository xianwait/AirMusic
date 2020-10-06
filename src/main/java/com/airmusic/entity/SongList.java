package com.airmusic.entity;

import java.sql.Date;

public class SongList {
    private int mId;//歌单编号
    private String mName;//歌单名称
    private int mCreateName;//创建者编号
    private int mPlayCount;//播放量
    private int mEnshrineCount;//收藏量
    private Date mSongSetDate;//创建日期
    private int pictureID;//歌单图片编号


    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public int getmCreateName() {
        return mCreateName;
    }

    public void setmCreateName(int mCreateName) {
        this.mCreateName = mCreateName;
    }

    public int getmPlayCount() {
        return mPlayCount;
    }

    public void setmPlayCount(int mPlayCount) {
        this.mPlayCount = mPlayCount;
    }

    public int getmEnshrineCount() {
        return mEnshrineCount;
    }

    public void setmEnshrineCount(int mEnshrineCount) {
        this.mEnshrineCount = mEnshrineCount;
    }

    public Date getmSongSetDate() {
        return mSongSetDate;
    }

    public void setmSongSetDate(Date mSongSetDate) {
        this.mSongSetDate = mSongSetDate;
    }

    public int getPictureID() {
        return pictureID;
    }

    public void setPictureID(int pictureID) {
        this.pictureID = pictureID;
    }
}
