class HomeController < ApplicationController
  def index
    @bribes = Bribe.valid.order("created_at DESC").limit(8)
    @comments = Comment.valid.order("created_at DESC").limit(8)
  end
end
