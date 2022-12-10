class Pagination {
  int page = 1;
  int current = 0;

  int getPage(){
    return page;
  }

  int getCurrent(){
    return current;
  }

  void setPage(int page){
    this.page = page;
  }

  void setCurrent(int cur){
    current = cur;
  }
}