class CommentController < ApplicationController
  def save
    report = params[:report]
    question = params[:question]
    comment = Comment.find_by_report_and_question(report, question)
    if comment.nil? 
      comment = Comment.new(params[:comment])
      comment.report = report
      comment.question = question
      comment.user = session[:user]
      comment.save
      flash[:notice] = "Created text at:"+Time.now.to_s
    else
      comment.update_attributes(params[:comment])
      flash[:notice] = "Updated text at:"+Time.now.to_s
    end
    render :partial=>"show", :locals=>{:comment=>comment, :report=>report, :question=>question}
  end

  def show
    comment = params[:id].blank? ? nil : Comment.find(params[:id])
    comment = Comment.find_by_report_and_question(params[:report],params[:question]) if comment.nil? unless (params[:question].blank? || params[:report].blank?) 
    if comment.nil?
      comment = Comment.new
      report = params[:report]
      question = params[:question]
    else
      report = comment.report
      question = comment.question
    end
    render :partial=>"show", :locals=>{:comment=>comment, :report=>report, :question=>question}
  end

end
