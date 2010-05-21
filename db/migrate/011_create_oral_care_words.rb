class CreateOralCareWords < ActiveRecord::Migration
  def self.up
    create_table :oral_care_words do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :oral_care_words
  end
end
