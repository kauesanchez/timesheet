class Floss < ActiveRecord::Base
  has_and_belongs_to_many :colgate_surveys

  def to_s
    name
  end
end
