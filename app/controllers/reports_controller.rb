class ReportsController < ApplicationController
  before_filter :login_required
  
  BOM = "\377\376" #Byte Order Mark
  
  def index
  end
    
  def colgate
    graphs
    @title =  'Healthy Mouth Survey Statistics'
    @pie_graphs -= ["time_to_answer","store","healthy_mouth","toothpaste_word_why","toothpaste_importance_other","oral_importance_why"]
    @bar_graphs+=[ ]
    respond_to do |format|
      format.html
      format.csv { export_csv(@model) }
    end
  end
  
  
  def add_ids
    model = (params[:id]+'_survey').classify.constantize
    ids_to_add = model.find(:all, :select=>:id, :conditions=>{params[:attribute]=>params[:value]}).collect(&:id)
    session[:"#{params[:id]}_unchecked_ids"].delete params[:checkbox_id]
    render :text => session[:"#{params[:id]}_ids"] += ids_to_add
  end
  
  def remove_ids
    model = (params[:id]+'_survey').classify.constantize
    ids_to_remove = model.find(:all, :select=>:id, :conditions=>{params[:attribute]=>params[:value]}).collect(&:id)
    session[:"#{params[:id]}_unchecked_ids"] << params[:checkbox_id]
    render :text => session[:"#{params[:id]}_ids"] -= ids_to_remove
  end
  
  def add_relation_ids
    relation_model = params[:model].classify.constantize
    model = params[:id]+'_surveys'
    ids_to_add = relation_model.find(params[:value]).send(model).find(:all, :select=>:id).collect(&:id)
    session[:"#{params[:id]}_unchecked_ids"].delete params[:checkbox_id]
    render :text => session[:"#{params[:id]}_ids"] += ids_to_add
  end
  
  def remove_relation_ids
    relation_model = params[:model].constantize
    model = params[:id]+'_surveys'
    ids_to_add = relation_model.find(params[:value]).send(model).find(:all, :select=>:id).collect(&:id)
    session[:"#{params[:id]}_unchecked_ids"] << params[:checkbox_id]
    render :text => session[:"#{params[:id]}_ids"] -= ids_to_add
  end
  
  protected
  def graphs
    flash[:notice]=""
    @model = "#{action_name}_survey".classify.constantize
    if session[:"#{action_name}_ids"].nil?
      session[:"#{action_name}_ids"] = @model.ids
      session[:"#{action_name}_unchecked_ids"] = []
    end 
    @pie_graphs = @model.columns.collect(&:name)-["created_at","updated_at","id"]
    @bar_graphs = []
    @model.reflections.each{|key,value| @bar_graphs << key.to_s if [:has_and_belongs_to_many, :has_many].include? value.macro}
  end
  
    def export_csv
      filename = I18n.l(Time.now, :format => :short) +  "-#{model.class_name}.csv"
      content = FasterCSV.generate(:col_sep => "\t") do |csv|
        fields =  [:id, :created_at]
        fields += ColgateSurvey::QUESTION.delete_if(&:nil?).collect{|question| question[:fields]}.flatten
        questions = fields.collect{ |field| (ColgateSurvey::ATTRIBUTE_QUESTION[field] || 0).to_s+': '+ColgateSurvey::question(field) }
        csv << questions
        ColgateSurvey.all.each do |survey|
          data = fields.collect{ |field| survey.chosen(field) }
          csv << data
        end
        csv
      end
      content = BOM + Iconv.conv("utf-16le", "utf-8", content)
      send_data content, :filename => filename
    end

    def get_value(value)
      case value
      when 'false' then false
      when 'true' then true
      else value
      end
    end

  
  
end


