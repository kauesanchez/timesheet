class ToothpasteWord < ActiveRecord::Base
  has_many :colgate_rate
  has_many :colgate_surveys, :through => :colgate_rate
  
  def to_img
    name.downcase.gsub(/\s+/,'_')+'.png'
  end
  
  def to_label
    name
  end
  
end
