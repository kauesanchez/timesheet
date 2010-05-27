class CreateColgateSurveysFlosses < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_flosses, :id=>false do |t|
      t.references :colgate_survey
      t.references :floss
    end
  end

  def self.down
    drop_table :colgate_surveys_flosses
  end
end
