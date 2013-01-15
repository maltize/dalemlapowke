# encoding: UTF-8
class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    # Check if remote_ip is working on production
    @comment.user = request.remote_ip
    @bribe = @comment.bribe

    redirect_to(bribes_path) and return unless @bribe.validated_at?

    if @comment.save
      redirect_to(bribes_path(@comment.bribe), :notice => "Twój komentarz został zapisany. Po zatwierdzeniu przez administratora pojawi się na stronie.")
    else
      @comments = @bribe.comments.valid
      render "bribes/show"
    end
  end

end
