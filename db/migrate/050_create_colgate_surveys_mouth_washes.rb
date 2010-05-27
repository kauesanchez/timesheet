class CreateColgateSurveysMouthWashes < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_mouth_washes, :id=>false do |t|
      t.references :colgate_survey
      t.references :mouth_wash
    end
  end

  def self.down
    drop_table :colgate_surveys_mouth_washes
  end
end
