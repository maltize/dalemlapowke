class Admin::CommentsController < Admin::BaseController

  PER_PAGE = 10

  def index
    @comments = Comment.order('id DESC').paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
  end

  def valid
    @comments = Comment.valid.paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
    render :index
  end

  def not_valid
    @comments = Comment.not_valid.order('id DESC').paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
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

  def validate
    @comment = Comment.find(params[:id])
    @comment.valid!

    redirect_to :back
  end

  def unvalidate
    @comment = Comment.find(params[:id])
    @comment.unvalid!

    redirect_to :back
  end
end
