class CreateColgateSurveysOccasionWords < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_occasion_words, :id=>false do |t|
      t.references :colgate_survey
      t.references :occasion_word
    end
  end

  def self.down
    drop_table :colgate_surveys_occasion_words
  end
end
