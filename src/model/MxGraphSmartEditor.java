package model;

import java.util.Date;

/**
 * mxgraph 다이어그램 정보
 * Created by kimjaesu on 2017. 2. 9..
 */
public class MxGraphSmartEditor {

    /**
     * 신규여부
     */
    boolean isNew;

    /**
     * 다이어그램 식별 순번
     */
    long mxGraphSeq;

    /**
     * 다이어그램 관리용 xml
     */
    String modelXml;

    /**
     * 이미지 출력용 xml
     */
    String imageXml;

    /**
     * 이미지 가로길이
     */
    int imageWidth;

    /**
     * 이미지 세로길이
     */
    int imageHeight;

    /**
     * 이미지 배경색, RGB Hexadecimal Colors, ex. #FFFFFF
     */
    String imageBgColor;

    /**
     * 등록자 id
     */
    String createUserId;

    /**
     * 등록일시
     */
    Date createDate;

    /**
     * 변경자 id
     */
    String updateUserId;

    /**
     * 변경일시
     */
    Date updateDate;

    /**
     * 신규여부
     * @return
     */
    public boolean isNew() {
        return isNew;
    }

    /**
     * 신규여부
     * @param aNew
     */
    public void setNew(boolean aNew) {
        isNew = aNew;
    }

    /**
     * 다이어그램 식별 순번
     * @return
     */
    public long getMxGraphSeq() {
        return mxGraphSeq;
    }

    /**
     * 다이어그램 식별 순번
     * @param mxGraphSeq
     */
    public void setMxGraphSeq(long mxGraphSeq) {
        this.mxGraphSeq = mxGraphSeq;
    }

    /**
     * 다이어그램 관리용 xml
     * @return
     */
    public String getModelXml() {
        return modelXml;
    }

    /**
     * 다이어그램 관리용 xml
     * @param modelXml
     */
    public void setModelXml(String modelXml) {
        this.modelXml = modelXml;
    }

    /**
     * 이미지 출력용 xml
     * @return
     */
    public String getImageXml() {
        return imageXml;
    }

    /**
     * 이미지 출력용 xml
     * @param imageXml
     */
    public void setImageXml(String imageXml) {
        this.imageXml = imageXml;
    }

    /**
     * 이미지 가로길이
     * @return
     */
    public int getImageWidth() {
        return imageWidth;
    }

    /**
     * 이미지 가로길이
     * @param imageWidth
     */
    public void setImageWidth(int imageWidth) {
        this.imageWidth = imageWidth;
    }

    /**
     * 이미지 세로길이
     * @return
     */
    public int getImageHeight() {
        return imageHeight;
    }

    /**
     * 이미지 세로길이
     * @param imageHeight
     */
    public void setImageHeight(int imageHeight) {
        this.imageHeight = imageHeight;
    }

    /**
     * 이미지 배경색, RGB Hexadecimal Colors, ex. #FFFFFF
     * @return
     */
    public String getImageBgColor() {
        return imageBgColor;
    }

    /**
     * 이미지 배경색, RGB Hexadecimal Colors, ex. #FFFFFF
     * @param imageBgColor
     */
    public void setImageBgColor(String imageBgColor) {
        this.imageBgColor = imageBgColor;
    }

    /**
     * 등록자 id
     * @return
     */
    public String getCreateUserId() {
        return createUserId;
    }

    /**
     * 등록자 id
     * @param createUserId
     */
    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    /**
     * 등록일시
     * @return
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 등록일시
     * @param createDate
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 변경자 id
     * @return
     */
    public String getUpdateUserId() {
        return updateUserId;
    }

    /**
     * 변경자 id
     * @param updateUserId
     */
    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }

    /**
     * 변경일자
     * @return
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 변경일자
     * @param updateDate
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

}
