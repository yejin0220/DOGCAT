package com.kh.count.model.vo;

public class Count {
	
	private int userNo;
	private int bCount;
	private int sCount;
	private int cCount;
	private int mCount;
	
	public Count() {
		super();
	}

	public Count(int userNo, int bCount,int sCount,  int cCount, int mCount) {
		super();
		this.userNo = userNo;
		this.bCount = bCount;
		this.sCount = sCount;
		this.cCount = cCount;
		this.mCount = mCount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public int getmCount() {
		return mCount;
	}

	public void setmCount(int mCount) {
		this.mCount = mCount;
	}

	@Override
	public String toString() {
		return "Count [userNo=" + userNo + ", bCount=" + bCount + ", sCount=" + sCount + ", cCount=" + cCount
				+ ", mCount=" + mCount + "]";
	}

	
	
}
