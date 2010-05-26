class CreateColgateSurveysToothpasteWords < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys_toothpaste_words, :id=>false do |t|
      t.references :colgate_survey
      t.references :toothpaste_word
    end
  end

  def self.down
    drop_table :colgate_surveys_toothpaste_words
  end
end
