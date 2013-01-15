# encoding: UTF-8
class BribesController < ApplicationController

  PER_PAGE = 10

  def index
    @bribes = Bribe.valid.paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
  end

  def show
    @bribe = Bribe.find(params[:id])
  end

  def new
    @bribe = Bribe.new
  end

  def create
    @bribe = Bribe.new(params[:bribe])
    # Check if remote_ip is working on production
    @bribe.user = request.remote_ip

    if @bribe.save
      redirect_to(root_path, :notice => "Twoja historia została zapisana. Po zatwierdzeniu przez administratora pojawi się na liście.")
    else
      render :action => "new"
    end
  end
end
