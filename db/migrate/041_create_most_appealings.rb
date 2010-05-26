class CreateMostAppealings < ActiveRecord::Migration
  def self.up
    create_table :most_appealings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :most_appealings
  end
end
