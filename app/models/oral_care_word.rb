class OralCareWord < ActiveRecord::Base
  has_many :colgate_surveys
  
  def to_label
    name
  end
  
end
