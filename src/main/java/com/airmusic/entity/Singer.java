package com.airmusic.entity;

public class Singer {
    private Integer sid;
    private String sSingerName;
    private String sSingerSynopsis;
    private int pictureID;

    public Singer(String sSingerName, String sSingerSynopsis, int pictureID) {
        this.sSingerName = sSingerName;
        this.sSingerSynopsis = sSingerSynopsis;
        this.pictureID = pictureID;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getsSingerName() {
        return sSingerName;
    }

    public void setsSingerName(String sSingerName) {
        this.sSingerName = sSingerName;
    }

    public String getsSingerSynopsis() {
        return sSingerSynopsis;
    }

    public void setsSingerSynopsis(String sSingerSynopsis) {
        this.sSingerSynopsis = sSingerSynopsis;
    }

    public int getPictureID() {
        return pictureID;
    }

    public void setPictureID(int pictureID) {
        this.pictureID = pictureID;
    }
}
