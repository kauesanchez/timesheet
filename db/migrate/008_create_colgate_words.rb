class CreateColgateWords < ActiveRecord::Migration
  def self.up
    create_table :colgate_words do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :colgate_words
  end
end
