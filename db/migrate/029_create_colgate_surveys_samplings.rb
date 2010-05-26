class CreateColgateSurveysSamplings < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_samplings, :id=>false do |t|
      t.references :colgate_survey
      t.references :sampling
    end
  end

  def self.down
    drop_table :colgate_surveys_samplings
  end
end
