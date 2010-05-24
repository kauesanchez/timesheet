class ColgateWord < ActiveRecord::Base
   has_and_belongs_to_many :colgate_surveys
  
  def to_label
    name
  end
  
end
