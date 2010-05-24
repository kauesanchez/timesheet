class CreateColgateSurveys < ActiveRecord::Migration
  def self.up
    create_table :colgate_surveys do |t|
      t.references :age_group
      t.string  :gender , :limit => 1
      t.references :state
      t.integer :income_group_id
      t.integer :time_to_answer
      t.string :first_word
      t.text :healthy_mouth
      t.string :toothpaste_word_why
      t.string :toothpaste_importance_other
      t.string :oral_importance_why
      t.references :sampling
      t.references :care_day
      t.integer :packaging
      t.integer :coupon
      t.integer :new_usage
      t.integer :new_oral
      t.integer :professional
      t.integer :other
      

      t.timestamps
    end
  end

  def self.down
    drop_table :colgate_surveys
  end
end
