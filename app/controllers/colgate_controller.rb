class ColgateController < SurveyController
  
  def sub_layout
      action_name == "finished"  ? "no_sub_layout" : "colgate"
  end
  def technology_rates_dataset(ids)
    dataset = []
    [:onstar_importance,:link_importance,:sync_importance,:mygig_importance,:musicbox_importance].each do |att|
      dataset << {:label=>model::question(att), :value=>model::average(att, :conditions=>{:id => ids })}
    end
     ["Average technology rates",dataset]
  end  
  
  
  
  def finished
     @reports = ["age_group_id"]
     if cookies[:colgate_id].blank? || !model::PUBLISHED
       if session[:colgate_id].blank?
         session[:colgate_id] = ColgateSurvey.new
         redirect_to :action=>:questions, :id=>1
       else
         @question_number = ColgateSurvey::NUMBER_OF_QUESTIONS
         @colgate = session[:colgate]
         @colgate.time_to_answer = Time.now - session[:start_time].to_i
         @colgate.save
         cookies[:colgate_id] = { 
           :value=>@colgate.id,
           :expires => 1.year.from_now
         }
       end
     else
       @question_number = ColgateSurvey::NUMBER_OF_QUESTIONS
       @colgate = ColgateSurvey.find(cookies[:colgate_id])
       session[:start_time] = Time.now - @colgate.time_to_answer
     end
   end
  
  
  def facebook_share
     @colgate = ColgateSurvey.find(params[:id])
     @title="What's Your Definition of Luxury Car?"
     @description="I got a #{@colgate.chosen(params[:attribute])} car. 
     #{@quality.percent(params[:attribute]).to_i}% other people got the same one.
     See how many of my friends also got a #{@colgate.chosen(params[:attribute])} car."
     render :action=>:facebook, :layout=>false
   end
  
  
  
  protected   
  def question_1
    session[:start_time] = Time.now
    session[:colgate] = model.new if !model::PUBLISHED
  end
  
  def question_2
     @question_number = params[:id].to_i
     session[:"#{controller_name}"].attributes = params[:"#{controller_name}"]
     #raise session[:"#{controller_name}"].inspect
     if !session[:"#{controller_name}"].valid?
       @question_number -= 1
       
     end
   end
end
