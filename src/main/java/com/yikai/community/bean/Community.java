package com.yikai.community.bean;

public class Community {
    private Integer cmyId;

    private String cmyName;

    public Integer getCmyId() {
        return cmyId;
    }

    public void setCmyId(Integer cmyId) {
        this.cmyId = cmyId;
    }

    public String getCmyName() {
        return cmyName;
    }

    public void setCmyName(String cmyName) {
        this.cmyName = cmyName == null ? null : cmyName.trim();
    }
}