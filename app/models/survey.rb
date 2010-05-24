class Survey < ActiveRecord::Base
  self.abstract_class = true
  
  attr_accessor :question_number
  
  def self.to_csv(extra_fields=[])
    #nao funciona em ruby 1.9
    FasterCSV.generate(:col_sep => "\t") do |csv|
      fields =  [:id, :created_at] + extra_fields
      fields += self::QUESTION.delete_if(&:nil?).collect{|question| question[:fields]}.flatten
      fields -= self::EXTRA_GRAPHS.delete_if(&:nil?).flatten
      csv << fields.collect{ |field| (self::ATTRIBUTE_QUESTION[field] || 0).to_s+': '+question(field) }
      self.all.each do |survey|
        csv << fields.collect{ |field| survey.chosen(field) }
      end
    end
  end
  
  def self.type_validations
     self::QUESTION.each do |question|
       case question[:type]
       when :boolean,:multiple_booleans then question[:fields].each do |field| validates_inclusion_of field, :in=>[true,false] end
       when :boolean_who, :boolean_what, :boolean_why then
         boolean, what = question[:fields]
         validates_inclusion_of boolean, :in=>[true,false]
         validates_presence_of what, :if=>Proc.new {|survey| survey[boolean] && survey.question_number > self::ATTRIBUTE_QUESTION[what] }
       when :markable, :markable_grid5, :markable_grid3 then validates_presence_of question[:fields].first
        # text = question[:fields]
       #  validates_presence_of text, :if=> Proc.new {|survey| survey[text] && survey.question_number > self::ATTRIBUTE_QUESTION[text] }, :message=>" must write something"
       end unless question.blank? || question[:type].blank?
     end
   end

   def self.validates_presence_of(*attr_names)
     options = attr_names.extract_options!
     number = attr_names.collect do |name|
       raise "on validates_presence_of: attribute '#{name}' not found on ATTRIBUTE_QUESTION" if self::ATTRIBUTE_QUESTION[name].nil?
       self::ATTRIBUTE_QUESTION[name]
     end.max
     configuration = {:message=>" must select one", :if=> Proc.new {|survey| survey.question_number > number } }
     configuration.merge!(options)
     super(attr_names, configuration)
   end

   def self.validates_inclusion_of(*attr_names)
     options = attr_names.extract_options!
     number = attr_names.collect do |name|
       raise "on validates_inclusion_of: attribute '#{name}' not found on ATTRIBUTE_QUESTION" if self::ATTRIBUTE_QUESTION[name].nil?
       self::ATTRIBUTE_QUESTION[name]
     end.max
     configuration = {:message=>" must select one", :if=> Proc.new {|survey| survey.question_number > number }}
     configuration.merge!(options)
     super(attr_names, configuration)
   end
  
  def self.ids
    find(:all, :select=>:id).collect(&:id)
  end
  
  def self.question(attribute)
    case attribute.to_s
    when "year" then "Car year"
    when "age_group_id" then "Age group"
    when "income_group_id" then "Income group"
    when "familiar_crossover" then "Crossover"   
      
    else
      attribute.to_s.humanize
    end
  end
  
  
  def value(attribute)
    send(attribute)
  end
  
  def chosen(attribute)
    case attribute.to_s
    when "model_id" then model.name
    when "make_id"  then make.name
    when "new_car"  then new_car ? "New" : "Used"
    when "gender" then gender == 'M' ? "Man" : "Woman"
    when "income_group_id" then income_group.label
    when "time_to_answer" then "#{time_to_answer/60}:#{time_to_answer%60}"
    when /_id$/ 
      table = send(attribute.to_s.sub(/_id$/,''))
      if table.respond_to?("to_label")
        table.to_label
      elsif table.respond_to?("name")
        table.name
      else  
        table.to_s
      end
    else
      if self.class.reflections.keys.include?(attribute.to_sym) && [:has_and_belongs_to_many, :has_many].include?(self.class.reflections[attribute.to_sym].macro)
        relation = send(attribute.to_s.sub(/_ids$/,'s'))
        relation.collect do |table|
          if table.respond_to?("to_label")
            table.to_label
          elsif table.respond_to?("name")
            table.name
          else  
            table.to_s
          end
        end.join ','
      else
        self[attribute]
      end
    end
  end
  
  def percent(attribute)
    value = self[attribute]
    (self.class.count(:conditions=>{attribute=>value})*100.0)/self.class.count
  end
  
  def self.to_xml_pie_graph_ids(attribute, ids = nil)
    if ids.nil?
      self.to_xml_pie_graph(attribute)
    else
      self.to_xml_pie_graph(attribute, {:id=>ids})
    end
  end
  
  def self.to_xml_bar_graph_ids(attribute, ids = nil)
    if ids.nil?
      self.to_xml_bar_graph(attribute)
    else
      self.to_xml_bar_graph(attribute, {:id=>ids})
    end
  end
  
  def self.to_dataset_pie_graph(attribute, conditions = {})
    find(:all, :group=>attribute, :select => "count(*) count, #{attribute}", :conditions=>conditions).collect do |survey|
      {:label=>survey.chosen(attribute).to_s,:value=>survey.count}
    end
  end

  
  def self.to_dataset_bar_graph(relation, conditions = {})
    relation.classify.constantize.all.collect do |record|
      count = record.send(self.class_name.tableize).count(:conditions=>conditions)
      label = record.respond_to?(:to_label) ? record.to_label : record.respond_to?(:name) ? record.name : record.to_s
      {:label=>label, :value=>count}
    end.select{|dataset| !dataset.blank? && !dataset[:value].blank? && dataset[:value]!=0}
  end
  
  def self.reports
    result = self::QUESTION
    if defined?(self::EXTRA_GRAPHS) && !self::EXTRA_GRAPHS.blank?
      self::EXTRA_GRAPHS.each_with_index do |graph,i|
        next if graph.blank?
        result[i][:fields] = graph + result[i][:fields] unless result[i].nil?
      end
    end
    result
  end
end