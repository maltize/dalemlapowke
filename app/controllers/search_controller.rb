class SearchController < ApplicationController

  PER_PAGE = 10

  def find
    @bribes = Search.find(params[:query]).
      paginate(
        :page     => params[:page],
        :per_page => PER_PAGE
      )
  end

end
