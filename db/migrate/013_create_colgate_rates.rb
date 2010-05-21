class CreateColgateRates < ActiveRecord::Migration
  def self.up
    create_table :colgate_rates do |t|
      t.references :colgate_survey
      t.references :toothpaste_word
      t.integer :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :colgate_rates
  end
end
