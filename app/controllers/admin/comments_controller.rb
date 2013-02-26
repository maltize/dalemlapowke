class Admin::CommentsController < Admin::BaseController

  PER_PAGE = 10

  def index
    @comments = Comment.order('id DESC').paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
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

    redirect_to admin_comments_path
  end

end
