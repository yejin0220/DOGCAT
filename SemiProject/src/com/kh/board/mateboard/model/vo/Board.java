package com.kh.board.mateboard.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo; //	BOARD_NO
	private int boardType; //	BOARD_TYPE
	private String boardCategory; //	BOARD_CATEGORY �Խñ� �ۼ��� ��ȣ(category_no)�� �״�� �޴� ���� ��ȸ�� ī�װ���(category_name)���� ��ȸ�ϴ� ���
	private String boardTitle; //	BOARD_TITLE
	private String boardContent; //	BOARD_CONTENT
	private String boardWriter; //	BOARD_WRITER �ۼ��� ȸ����ȣ(user_no), ��ȸ�� ȸ�����̵�(user_id)�� ��ȸ
	private int count; //	COUNT
	private Date createDate;//	CREATE_DATE
	private String sale; //	SALE
	private String address; //	ADDRESS
	private double latitude; //	LATITUDE
	private double longitude; //	LONGITUDE
	private String status; //	STATUS
	private String pet; // �ݷ��� ����
	private int Lcount;//��õ ����
	private String fileName;
	private int applyCount;
	
	
	
	public Board() {
		super();
	}
	
	public Board(int boardNo, int boardType, String boardCategory, String boardTitle, String boardContent,
			String boardWriter, int count, Date createDate, String sale, String address, double latitude,
			double longitude, String status) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardCategory = boardCategory;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.sale = sale;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.status = status;
	}
	
	
	/*��å����Ʈ �Խ��� �ʿ�����*/
	public Board(int boardNo, int boardType, String boardTitle, String boardContent, String boardWriter, int count,
			Date createDate, String address, double latitude, double longitude, String status) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.status = status;
	}
	
	public Board(int boardNo, String boardTitle, String boardContent, String boardWriter, int count,
			Date createDate, String address, String status, String pet) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.address = address;
		this.status = status;
	}
	
	public Board(int boardNo, String boardTitle, String boardContent, String boardWriter, int count, Date createDate,
			String address, int Lcount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.address = address;
		this.Lcount=Lcount;
		
	}

	
	
	public Board(int boardNo, String boardTitle, String boardContent, String boardWriter, int count, Date createDate,
			String address) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.address = address;
	}
	

	public Board(String boardTitle, String boardContent, String address, String boardWriter,double latitude,double longitude) {
		super();
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.address = address;
		this.boardWriter=boardWriter;
		this.latitude=latitude;
		this.longitude=longitude;
	}
	
	public Board(int boardNo,String boardTitle, String boardContent, String address, String boardWriter,double latitude,double longitude) {
		super();
		this.boardNo=boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.address = address;
		this.boardWriter=boardWriter;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	

	public Board(int boardNo,String boardTitle, String boardContent, String boardWriter, Date createDate, String address,double latitude,double longitude,int count) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.createDate = createDate;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.count = count;
		
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}
	
	
	public int getLcount() {
		return Lcount;
	}

	public void setLcount(int lcount) {
		Lcount = lcount;
	}
	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public int getApplyCount() {
		return applyCount;
	}

	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardCategory=" + boardCategory
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardWriter=" + boardWriter
				+ ", count=" + count + ", createDate=" + createDate + ", sale=" + sale + ", address=" + address
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", status=" + status + ", pet=" + pet + "]";
	}
	
	
	
}
