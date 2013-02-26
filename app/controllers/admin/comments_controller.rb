class Admin::CommentsController < Admin::BaseController

  def index
    @comments = Comment.all(params[:page])
  end

  def valid
    @comments = Comment.valid(params[:page])
    render :index
  end

  def not_valid
    @comments = Comment.not_valid(params[:page])
    render :index
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Zmiany zapisane pomyslnie!') }
        format.json { respond_with_bip(@comment) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@comment) }
      end
    end
  end

  def perform
    @comment = Comment.find(params[:id])
    params[:v].present? ? @comment.valid! : @comment.unvalid!

    redirect_to :back
  end

end
