# encoding: UTF-8
class BribesController < ApplicationController

  before_filter :load_kind

  PER_PAGE = 10

  def index
    @bribes = Bribe.valid
    @bribes = @bribes.where(:kind => @kind.id) if @kind
    @bribes = @bribes.paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
  end

  def show
    @bribe = Bribe.valid.find(params[:id])
    @comments = @bribe.comments.valid
    @comment = @bribe.comments.build
  end

  def new
    @bribe = Bribe.new
  end

  def create
    @bribe = Bribe.new(params[:bribe])
    # Check if remote_ip is working on production
    @bribe.user = request.remote_ip

    if @bribe.save
      redirect_to(root_path, :notice => "Twoja historia została zapisana. Po zatwierdzeniu przez administratora pojawi się na stronie.")
    else
      render :action => "new"
    end
  end

private

  def load_kind
    @kind = Kind.find params[:kind]
  end

end
