class State < ActiveRecord::Base
  def self.options_for_select
    find(:all, :order=>:name).collect{|state| [state.name,state.id] }
  end
  
  def to_s
    name
  end
end
