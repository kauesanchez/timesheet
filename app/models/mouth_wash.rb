class MouthWash < ActiveRecord::Base
  has_and_belongs_to_many :colgates_surveys

  def to_s
    name
  end
end
