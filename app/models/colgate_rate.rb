class ColgateRate < ActiveRecord::Base
    belongs_to :colgate_survey

    def to_label
      "#{toothpaste_word.to_label}: #{rate}"
    end

    def self.to_dataset_bar_graph(conditions)
      ToothpasteWord.all.collect{|word| {:label=>word.name, :value=>ColgateRate.average(:rate, :conditions=>conditions.merge({:toothpaste_word_id=>word.id})).to_f} }.select{|set| set[:value]>0 }
    end

    def self.to_label_bar_graph
      "Average Rates for Colgate Words"
    end
  
end
