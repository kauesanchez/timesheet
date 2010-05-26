class StatementMostAppealing < ActiveRecord::Base
  def to_s
    name
  end
end
