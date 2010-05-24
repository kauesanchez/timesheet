class IncomeGroup < ActiveRecord::Base
  has_many :colgate_surveys  
  
  MAX_VALUE = 5
  
  def self.options_for_select
    find(:all, :order=>:min_income).collect{ |income| [income.to_s, income.id] }
  end
  
  def to_cypher
    case value
      when MAX_VALUE then '$'*value + '+'
      else '$'*value
    end
  end
  
  def to_img
    if value == MAX_VALUE
      "income_$$$$$.png"
    else
      "income_#{to_cypher}.png"
    end
  end
end
