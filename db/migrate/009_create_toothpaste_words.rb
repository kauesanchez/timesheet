class CreateToothpasteWords < ActiveRecord::Migration
  def self.up
    create_table :toothpaste_words do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :toothpaste_words
  end
end
