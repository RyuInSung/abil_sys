package kr.or.ddit.command;

public class CriteriaCommand {

	private String page;
	private String perPageNum;
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public Criteria toCommExpmntMethCriteria()
	{
		Criteria cri = new Criteria();
		
		if(page!=null && !page.isEmpty()) //멤버변수 기본값 초기화 되어있으니 else로 궂이 또 안넣어줘도된다.
		{
			cri.setPage(Integer.parseInt(page));
		}
		
		if(perPageNum!=null && !perPageNum.isEmpty())
		{
			cri.setPerPageNum(Integer.parseInt(perPageNum));
		}
		
		return cri;
	}

}
