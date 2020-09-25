package com.airmusic.entity;

public class Audio {
    private Integer rid;
    private String rAudioName;
    private String rAudio;

    public Audio() { }

    public Audio(String rAudioName, String rAudio) {
        this.rAudioName = rAudioName;
        this.rAudio = rAudio;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getrAudioName() {
        return rAudioName;
    }

    public void setrAudioName(String rAudioName) {
        this.rAudioName = rAudioName;
    }

    public String getrAudio() {
        return rAudio;
    }

    public void setrAudio(String rAudio) {
        this.rAudio = rAudio;
    }
}
