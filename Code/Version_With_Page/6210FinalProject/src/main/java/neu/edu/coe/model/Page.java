package neu.edu.coe.model;
import java.io.Serializable;

/*Page*/
public class Page implements Serializable {

	private static final long serialVersionUID = -3198048449643774660L;

	private int pageNow = 1; // Current Page

	private int pageSize = 1; // how many record will show on this page

	private int totalCount; // total record number

	private int totalPageCount; // total page number

	@SuppressWarnings("unused")
	private int startPos; // start point: from 0

	@SuppressWarnings("unused")
	private boolean hasFirst;// Does it has first page

	@SuppressWarnings("unused")
	private boolean hasPre;// Does it has previous page

	@SuppressWarnings("unused")
	private boolean hasNext;// Does it has next page

	@SuppressWarnings("unused")
	private boolean hasLast;// Does it has last page

	/**
	 * Pass in total record and current page
	 * @param totalCount
	 * @param pageNow
	 */
	public Page(int totalCount, int pageNow) {
		this.totalCount = totalCount;
		this.pageNow = pageNow;
	}

	/**
	 * get total page, totalCount/pageSize
	 * @return
	 */
	public int getTotalPageCount() {
		totalPageCount = getTotalCount() / getPageSize();
		return (totalCount % pageSize == 0) ? totalPageCount : totalPageCount + 1;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * get the starting position
	 * @return
	 */
	public int getStartPos() {
		return (pageNow - 1) * pageSize;
	}

	public void setStartPos(int startPos) {
		this.startPos = startPos;
	}

	/**
	 * is it the first page?
	 * @return
	 */
	public boolean isHasFirst() {
		return (pageNow == 1) ? false : true;
	}

	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}

	/**
	 * have previous page?
	 * @return
	 */
	public boolean isHasPre() {
		// has first means has previous page
		return isHasFirst() ? true : false;
	}

	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}

	/**
	 * has next page?
	 * @return
	 */
	public boolean isHasNext() {
		// has last means has next page
		return isHasLast() ? true : false;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	/**
	 * does it has last page
	 * @return
	 */
	public boolean isHasLast() {
		// if it is not the last page, it has last page
		return (pageNow == getTotalCount()) ? false : true;
	}

	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}

}
