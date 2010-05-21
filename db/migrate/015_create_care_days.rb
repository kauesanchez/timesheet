class CreateCareDays < ActiveRecord::Migration
  def self.up
    create_table :care_days do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :care_days
  end
end
