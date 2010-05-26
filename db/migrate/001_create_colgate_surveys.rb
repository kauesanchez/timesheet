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
      t.references :packaging
      t.references :coupon
      t.references :new_usage
      t.references :new_oral
      t.references :professional
      t.references :other
      t.references :mouth_wash
      t.references :floss
      t.references :toothpaste
      t.references :breath_mint
      t.references :whitening_kit
      t.references :water_jet
      t.integer :a_mouth_wash_id
      t.integer :a_floss_id 
      t.integer :a_toothpaste_id
      t.integer :a_breath_mint_id
      t.integer :a_whitening_kit_id
      t.integer :a_water_jet_id
      t.references :fights_germs
      t.references :toothpaste_clinically
      t.references :clinically_proven
      t.references :recommend_colgate
      t.references :purchase
      t.references :most_appealing
      t.references :last_appealing
      t.references :statement_most_appealing
      t.references :statement_last_appealing
      t.integer :floss_care_id
      t.text :store
      t.integer :colgate_important_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :colgate_surveys
  end
end
