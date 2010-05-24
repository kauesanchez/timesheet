class CreateColgateSurveysColgateWords < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_colgate_words, :id=>:false do |t|
      t.references :colgate_survey
      t.references :colgate_word
    end
  end

  def self.down
    drop_table :colgate_surveys_colgate_words
  end
end
