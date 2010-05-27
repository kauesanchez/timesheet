class CreateColgateSurveysWaterJets < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_water_jets, :id=>false do |t|
      t.references :colgate_survey
      t.references :water_jet
    end
  end

  def self.down
    drop_table :colgate_surveys_water_jets
  end
end
