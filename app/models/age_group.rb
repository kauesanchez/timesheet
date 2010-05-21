class AgeGroup < ActiveRecord::Base
  
  MIN_AGE = 17
  MAX_AGE = 54
  
  
  def to_label
    "#{self.min_age}-#{self.max_age}"
  end
  
  def to_s
    to_label
  end
    
  def to_img
    if min_age == MIN_AGE
      "min_age.png"
    elsif max_age == MAX_AGE
      "max_age.png"
    else  
      "age_#{min_age}-#{max_age}.png"
    end
  end
  
  def self.options_for_select
    self.find(:all, :order=>:min_age).collect{|age_group| [age_group.to_s, age_group.id] }
  end
end
