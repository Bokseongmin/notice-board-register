package com.example.vo;

public class SearchVo extends PagingVo{
    private String searchType, keyword, searchType_keyword;

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getSearchType_keyword() {
        if(searchType.equals("") || keyword.equals("")) {
            return "&searchType=&keyword=";
        } else {
            return "&searchType=" + searchType + "&keyword=" + keyword;
        }
    }

    public void setSearchType_keyword(String searchType_keyword) {
        this.searchType_keyword = searchType_keyword;
    }
}
