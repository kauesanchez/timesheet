class CreateColgateSurveysToothpastes < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_toothpastes, :id=>false do |t|
      t.references :colgate_survey
      t.references :toothpaste
    end
  end

  def self.down
    drop_table :colgate_surveys_toothpastes
  end
end
