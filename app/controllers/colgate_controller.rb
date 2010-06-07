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
     @reports = ["age_group_id","gender"]
     super
   end
  
  
  def facebook_share
     @colgate = ColgateSurvey.find(params[:id])
     @title="What's Your Definition of healthy mouth?"
     @description=""
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
