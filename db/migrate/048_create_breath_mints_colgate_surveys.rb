class CreateBreathMintsColgateSurveys < ActiveRecord::Migration
  def self.up
    create_table :breath_mints_colgate_surveys, :id=>false do |t|
      t.references :colgate_survey
      t.references :breath_mint
    end
  end

  def self.down
    drop_table :breath_mints_colgate_surveys
  end
end
