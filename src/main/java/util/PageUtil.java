package util;

public class PageUtil {
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	private int pageCount;
	private int pageNum;
	private int totalRowCount;
	
	public PageUtil() {
		
	}
	
	/**
	 * 
	 * @param pageNum: 현재 페이지 번호
	 * @param totlaRowCount: 전체 글의 갯수
	 * @param rowCount: 한 페이지에 보여질 글의 갯수
	 */
	public PageUtil(int pageNum, int totalRowCount, int rowCount) {
		startRow = (pageNum - 1) * rowCount + 1;
		endRow = startRow + (rowCount - 1);
		startPage = (pageNum - 1) / 5 * 5 + 1;
		pageCount = (int)Math.ceil((double)totalRowCount / rowCount);
		endPage = Math.min(startPage + 4, pageCount);
		this.pageNum = pageNum;
		this.totalRowCount = totalRowCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
}
