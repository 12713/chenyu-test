package org.srm.mdm.domain.entity;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by wangchenyu on 2019/1/26.
 */
public class User {
    //表Id
    private Integer authorityId;
    /**
     * 用户id
     */
    private Integer userId;
    //权限类型代码
    private String  authorityTypeCode;
    /**
     * 是否包含所有标识
     */
    private Integer includeAllFlag;
    //行版本号
    private Integer objectVersionNumber;

    private String creationDate;
    private Integer createdBy;
    private Integer lastUpdatedBy;
    private String  lastUpdateDate;

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAuthorityTypeCode() {
        return authorityTypeCode;
    }

    public void setAuthorityTypeCode(String authorityTypeCode) {
        this.authorityTypeCode = authorityTypeCode;
    }

    public Integer getIncludeAllFlag() {
        return includeAllFlag;
    }

    public void setIncludeAllFlag(Integer includeAllFlag) {
        this.includeAllFlag = includeAllFlag;
    }

    public Integer getObjectVersionNumber() {
        return objectVersionNumber;
    }

    public void setObjectVersionNumber(Integer objectVersionNumber) {
        this.objectVersionNumber = objectVersionNumber;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public Integer getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(Integer lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public String getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(String lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }
}
