class CreateToothpasteWordWhies < ActiveRecord::Migration
  def self.up
    create_table :toothpaste_word_whies do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :toothpaste_word_whies
  end
end
