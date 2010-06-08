class CreateColgateSurveysWhiteningKits < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_whitening_kits, :id=>false do |t|
      t.references :colgate_survey
      t.references :whitening_kit
    end
  end

  def self.down
    drop_table :colgate_surveys_whitening_kits
  end
end
