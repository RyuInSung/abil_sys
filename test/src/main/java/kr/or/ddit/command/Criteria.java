package kr.or.ddit.command;

public class Criteria {

	private int page=1; //현재 페이지
	private int perPageNum=10; //한페이지당 게시물 수
	private int startRowNum=0; //페이지 시작 번호
	
	public Criteria() {
	}
	
	public Criteria(int page, int perPageNum) {
		super(); //부모 클래스가 있다면 부모 기본 생성자 호출해주는게 좋다. 없으면 컴파일러가 추가한다. (첫줄에)
		this.page = page;
		this.perPageNum = perPageNum;
		setStartRowNum();
	}
	
	//parsing exception
	public Criteria(String pageStr, String perPageNumStr){
		this.page=Integer.parseInt(pageStr);
		this.perPageNum=Integer.parseInt(perPageNumStr);
		setStartRowNum();
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page<1)
		{
			this.page=1;
		}
		else
		{
			this.page = page;
		}
		setStartRowNum();
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<1)
		{
			this.perPageNum=10;
		}
		else
		{
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}
	
	private void setStartRowNum()
	{
		this.startRowNum=(this.page-1)*this.perPageNum;
	}
	
	public int getStartRowNum()
	{
		return this.startRowNum;
	}
	
}
