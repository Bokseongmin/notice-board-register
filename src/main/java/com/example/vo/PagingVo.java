package com.example.vo;

public class PagingVo {
    // 현재 페이지, 게시물 총 갯수, 페이지당 글 갯수, 페이징 번호, 보여줄 게시물, 보여줄 페이징 갯수
    private int bno, nowPage, cntPost, cntPerPage, pageNum, displayPost, pageNumCnt, startPage, lastPage;

    private boolean prev, next;

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }
    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getCntPost() {
        return cntPost;
    }

    public void setCntPost(int cntPost) {
        this.cntPost = cntPost;
        Calc();
    }

    public int getCntPerPage() {
        return cntPerPage;
    }

    public void setCntPerPage(int cntPerPage) {
        this.cntPerPage = cntPerPage;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getDisplayPost() {
        return displayPost;
    }

    public void setDisplayPost(int displayPost) {
        this.displayPost = displayPost;
    }

    public int getPageNumCnt() {
        return pageNumCnt;
    }

    public void setPageNumCnt(int pageNumCnt) {
        this.pageNumCnt = pageNumCnt;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    private void Calc() {

        // 마지막 번호
        lastPage = (int)(Math.ceil((double)nowPage / (double)pageNumCnt) * pageNumCnt);

        // 시작 번호
        startPage = lastPage - (pageNumCnt - 1);

        // 마지막 페이지 계산
        int tmp = (int)(Math.ceil((double)cntPost / (double)cntPerPage));

        if(lastPage > tmp) {
            lastPage = tmp;
        }

        prev = startPage == 1 ? false : true;
        next = lastPage * pageNumCnt >= cntPost ? false : true;

        displayPost = (nowPage - 1) * cntPerPage;
    }
}
