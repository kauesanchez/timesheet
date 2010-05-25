class ToothpasteWord < ActiveRecord::Base
  has_and_belongs_to_many :colgate_surveys
 
  
  def to_img
     case name
      when 'Colgate' then "colgate"
      when 'AIM' then "aim"
      when 'Aquafresh' then "aquafresh"
      when 'Pepsodent' then "pepsodent"
      when 'Arm & Hammer' then "arm_hammer"
      when 'Crest' then "crest"
      when 'Mentadent' then "mentadent"
      when 'Tom’s' then "tom"
        
      else""
      end + ".png"
      end
    end
  
  
  def to_label
    name
  end
  
end
