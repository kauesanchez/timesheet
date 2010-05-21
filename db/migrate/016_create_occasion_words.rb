class CreateOccasionWords < ActiveRecord::Migration
  def self.up
    create_table :occasion_words do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :occasion_words
  end
end
