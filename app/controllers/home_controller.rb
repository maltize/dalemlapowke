class HomeController < ApplicationController
  def index
    @bribes1 = Bribe.valid.where(:kind => 1).limit(8)
    @bribes2 = Bribe.valid.where(:kind => 2).limit(8)
    @bribes3 = Bribe.valid.where(:kind => 3).limit(8)
    @bribes4 = Bribe.valid.where(:kind => 4).limit(8)
  end
end
