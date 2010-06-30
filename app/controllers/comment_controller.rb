class CommentController < ApplicationController
  def save
    question = params[:question]
    comment = Comment.find_by_question(question)
    if comment.nil? 
      comment = Comment.new(params[:comment])
      comment.question = question
      comment.user = session[:user]
      comment.save
      flash[:notice] = "Created text at:"+Time.now.to_s
    else
      comment.update_attributes(params[:comment])
      flash[:notice] = "Updated text at:"+Time.now.to_s
    end
    render :partial=>"show", :locals=>{:comment=>comment,:question=>question}
  end

  def show
    comment = params[:id].blank? ? nil : Comment.find(params[:id])
    comment = Comment.find_by_question(params[:question]) if comment.nil? unless (params[:question].blank?) 
    if comment.nil?
      comment = Comment.new
      question = params[:question]
    else
      question = comment.question
    end
    render :partial=>"show", :locals=>{:comment=>comment,:question=>question}
  end

end
