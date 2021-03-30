class CommentsController < ApplicationController


  def create
         #@prototype = Prototype.find(params[:prototype_id])
         @comment = Comment.new(comment_params)
      if @comment.save
         redirect_to "/prototypes/#{@comment.prototype.id}"
      else
         
         render "prtotypes/show"
      end
  end

  def show
   @comments = Comment.all
  end

  

 

  private
  def comment_params
    params.require(:comment).permit(:text, :comment).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  
end
