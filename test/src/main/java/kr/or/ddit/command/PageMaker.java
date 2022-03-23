package kr.or.ddit.command;

public class PageMaker {
	
	private int totalCount; //전체 행의 갯수
	private int startPage=1; // 시작 페이지 번호
	private int endPage=1; // 마지막 페이지 번호
	private int realEndPage; // 끝 페이지 번호
	private boolean prev; //이전 페이지 버튼 유무
	private boolean next; //다음 페이지 버튼 유무
	
	private int displayPageNum=5; //한 페이지에 보여줄 페이지번호 갯수
	
	Criteria cri = new Criteria();

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

//	public void setStartPage(int startPage) {
//		this.startPage = startPage;
//	}

	public int getEndPage() {
		return endPage;
	}

//	public void setEndPage(int endPage) {
//		this.endPage = endPage;
//	}

	public int getRealEndPage() {
		return realEndPage;
	}

//	public void setRealEndPage(int realEndPage) {
//		this.realEndPage = realEndPage;
//	}

	public boolean isPrev() { //el문의 신기함.. 관행적으로 얼마나 많이 쓰고있냐..를 느낄수가있다..
		return prev;
	}

//	public void setPrev(boolean prev) {
//		this.prev = prev;
//	}

	public boolean isNext() {
		return next;
	}

//	public void setNext(boolean next) {
//		this.next = next;
//	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

//	public void setDisplayPageNum(int displayPageNum) {
//		this.displayPageNum = displayPageNum;
//	}
	
	private void calcData()
	{
		//total count 있어야 계산 가능
		//criteria는 명시적 초기화 되어있음.
		
		this.endPage=(int)(Math.ceil(cri.getPage()/(double)this.displayPageNum)*this.displayPageNum);
				
		this.startPage=(this.endPage-this.displayPageNum)+1;
		
		this.realEndPage=(int)(Math.ceil(this.totalCount/(double)cri.getPerPageNum()));
		
		if(this.startPage<0)
		{
			this.startPage=1;
		}
		
		if(this.endPage>this.realEndPage)
		{
			this.endPage=this.realEndPage;
		}
		
		this.prev=this.startPage==1?false:true;
		this.next=this.endPage>=this.realEndPage?false:true;
	}
}
