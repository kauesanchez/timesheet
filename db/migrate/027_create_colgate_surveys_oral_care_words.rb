class CreateColgateSurveysOralCareWords < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_oral_care_words, :id=>:false do |t|
      t.references :colgate_survey
      t.references :oral_care_word
    end
  end

  def self.down
    drop_table :colgate_surveys_oral_care_words
  end
end
