class SurveyController < ApplicationController
  def boolean
    @field = @model::QUESTION[@question_number][:fields].first
    render :partial=>"survey/boolean", :layout=>true
  end
  
  def boolean_who
    @boolean, @who = @model::QUESTION[@question_number][:fields]
    render :partial=>"survey/boolean_who", :layout=>true
  end
  
  def boolean_comments
    @boolean, @comments = @model::QUESTION[@question_number][:fields]
    render :partial=>"survey/boolean_comments", :layout=>true
  end
  
  def boolean_what
     @boolean, @what = @model::QUESTION[@question_number][:fields]
     render :partial=>"survey/boolean_what", :layout=>true
   end
  
  def multiple_booleans
    @fields = @model::QUESTION[@question_number][:fields]
    render :partial=>"survey/multiple_booleans", :layout=>true
  end
  
  def text_area
    @text = @model::QUESTION[@question_number][:fields]
    render :partial=>"survey/text_area"
  end
  
  def markable
    @relation_id = @model::QUESTION[@question_number][:fields].first
    @relation = @relation_id.to_s.gsub(/_id$/,'').pluralize.singularize.classify.constantize
    render :partial=>"survey/markable", :layout=>true
  end
  
  def markable_grid3
    @relation_id = @model::QUESTION[@question_number][:fields].first
    @relation = @relation_id.to_s.gsub(/_id$/,'').pluralize.singularize.classify.constantize
    render :partial=>"survey/markable_grid3", :layout=>true
  end
  
  def markable_grid5
    @relation_id = @model::QUESTION[@question_number][:fields].first
    @relation = @relation_id.to_s.gsub(/_id$/,'').pluralize.singularize.classify.constantize
    render :partial=>"survey/markable_grid5", :layout=>true
  end
  
  def text
    render :partial=>"survey/text"
  end
  
  def pie_graphs
    if self.respond_to?(params[:id]+"_dataset")
      title,dataset = send(params[:id]+"_dataset")
    else
      title,dataset = model.question(params[:id]),model.to_dataset_pie_graph(params[:id], {:id=>session[:"#{controller_name}_ids"]})
    end
    render :partial=>"reports/pie_graph", :locals=>{:dataset=>dataset, :title=>title}
  end

  def bar_graphs
    if self.respond_to?(params[:id]+"_dataset")
      title,dataset = send(params[:id]+"_dataset",session[:"#{controller_name}_ids"])
    else
      related_model = params[:id].classify.constantize
      title,dataset = if related_model.respond_to?(:to_dataset_bar_graph)
        [related_model.to_label_bar_graph,related_model.to_dataset_bar_graph({:"#{controller_name}_survey_id"=>session[:"#{controller_name}_ids"]})]
      else
        [model.question(params[:id]),model.to_dataset_bar_graph(params[:id], {:id=>session[:"#{controller_name}_ids"]})]
      end
    end
    render :partial=>"reports/bar_graph", :locals=>{:dataset=>dataset, :title=>title}
  end
  
  def add_all_ids
    session[:"#{controller_name}_ids"] = model.ids
    session[:"#{controller_name}_unchecked_ids"] = []
    redirect_to :controller=>:reports, :action=>controller_name
  end
  
  def index
    redirect_to :action=>:questions, :id=>1
  end
  
  def question_1
    session[:start_time] = Time.now
    session[:"#{controller_name}"] = model.new if !model::PUBLISHED
    @question_number = 1
  end
  
  def model
    @model = (controller_name.classify+"Survey").constantize
  end
  
  def finished
    if cookies[:"#{controller_name}_id"].blank? || !model::PUBLISHED
      if session[:"#{controller_name}"].blank?
        session[:"#{controller_name}"] = model.new
        redirect_to :action=>:questions, :id=>1
      else
        @question_number = model::NUMBER_OF_QUESTIONS
        instance_variable_set("@#{controller_name}", session[:"#{controller_name}"])
        instance_variable_get("@#{controller_name}").time_to_answer = Time.now - session[:start_time].to_i
        instance_variable_get("@#{controller_name}").save
        cookies[:"#{controller_name}_id"] = { 
          :value=>instance_variable_get("@#{controller_name}").id,
          :expires => 1.year.from_now
        }
      end
    else
      @question_number = model::NUMBER_OF_QUESTIONS
      instance_variable_set("@#{controller_name}", model.find(cookies[:"#{controller_name}_id"]) )
      session[:start_time] = Time.now - instance_variable_get("@#{controller_name}").time_to_answer
    end
  end
  
  def questions
    if (cookies[:"#{controller_name}_id"].blank? || !model::PUBLISHED ) && (session[:"#{controller_name}"].blank?)
      session[:"#{controller_name}"] = model.new
      redirect_to :action=>:questions, :id=>1
    elsif !cookies[:"#{controller_name}_id"].blank? && model::PUBLISHED
      redirect_to :action=>:finished
    else  
      @question_number = session[:"#{controller_name}"].question_number = params[:id].to_i
      # In ruby 1.8.7 instance_methods returns a string, while in ruby 1.9.1 it returns symbols, thus the following if clause
      params[:"#{controller_name}"].each do |key, value|
        case key
        when /^\w+_id$/
          new_key = key.sub(/_id$/,'')
          session[:"#{controller_name}"].send("#{new_key}=", new_key.pluralize.classify.constantize.find(value)) unless value.blank?
        when /^\w+_ids$/
          new_key = key.sub(/_ids$/,'')
          #begin
            session[:"#{controller_name}"].send("#{new_key.pluralize}=", new_key.classify.constantize.find(value)) unless value.blank?
          #rescue
          #  session[:"#{controller_name}"].send("#{new_key.pluralize}=", value)
          #end
        else
          session[:"#{controller_name}"][key] = value
        end
      end unless params[:"#{controller_name}"].blank?
      @question_number -= 1 unless session[:"#{controller_name}"].valid? if @question_number > 1
      instance_variable_set("@#{controller_name}", session[:"#{controller_name}"])
      self.send("question_#{@question_number}") if self.respond_to?("question_#{@question_number}") || self.respond_to?(:"question_#{@question_number}")
      if @question_number > model::NUMBER_OF_QUESTIONS
        redirect_to :action=>:finished
      else
        if @model::QUESTION[@question_number].blank? || @model::QUESTION[@question_number][:type].blank?
          render :action=>"question_#{@question_number}"
        else
          send(@model::QUESTION[@question_number][:type])
        end
      end
    end
  end
end
