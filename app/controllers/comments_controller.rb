# encoding: UTF-8
class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    # Check if remote_ip is working on production
    @comment.user = request.remote_ip

    redirect_to(bribes_path) and return unless @comment.bribe.validated_at?

    if @comment.save
      redirect_to(bribes_path(@comment.bribe), :notice => "Twój komentarz został zapisany. Po zatwierdzeniu przez administratora pojawi się na stronie.")
    else
      redirect_to(bribes_path(@comment.bribe), :alert => "Twój komentarz nie został zapisany. Proszę poprawić formularz!")
    end
  end

end
