package smkim.board.dto;

public class BoardDTO {
	private String brdNum;
	private String mbrNum;
	private String brdTit;
	private String brdCont;
	private String brdWriteDate;
	private String brdDepth;
	private String brdParNum;
	private String mbrName;
	private String brdDelChk;
	
	private String pageSize;
	private String pageNum;
	private String rk;
	
	
	private String searchWord;
	
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public String getBrdNum() {
		return brdNum;
	}
	public void setBrdNum(String brdNum) {
		this.brdNum = brdNum;
	}
	public String getMbrNum() {
		return mbrNum;
	}
	public void setMbrNum(String mbrNum) {
		this.mbrNum = mbrNum;
	}
	public String getBrdTit() {
		return brdTit;
	}
	public void setBrdTit(String brdTit) {
		this.brdTit = brdTit;
	}
	public String getBrdCont() {
		return brdCont;
	}
	public void setBrdCont(String brdCont) {
		this.brdCont = brdCont;
	}
	public String getBrdWriteDate() {
		return brdWriteDate;
	}
	public void setBrdWriteDate(String brdWriteDate) {
		this.brdWriteDate = brdWriteDate;
	}
	public String getBrdDepth() {
		return brdDepth;
	}
	public void setBrdDepth(String brdDepth) {
		this.brdDepth = brdDepth;
	}
	public String getBrdParNum() {
		return brdParNum;
	}
	public void setBrdParNum(String brdParNum) {
		this.brdParNum = brdParNum;
	}
	public String getMbrName() {
		return mbrName;
	}
	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}
	public String getBrdDelChk() {
		return brdDelChk;
	}
	public void setBrdDelChk(String brdDelChk) {
		this.brdDelChk = brdDelChk;
	}
	@Override
	public String toString() {
		return "BoardDTO [brdNum=" + brdNum + ", mbrNum=" + mbrNum + ", brdTit=" + brdTit + ", brdCont=" + brdCont
				+ ", brdWriteDate=" + brdWriteDate + ", brdDepth=" + brdDepth + ", brdParNum=" + brdParNum
				+ ", mbrName=" + mbrName + ", brdDelChk=" + brdDelChk + "]";
	}
	public String getRk() {
		return rk;
	}
	public void setRk(String rk) {
		this.rk = rk;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	
	

}
