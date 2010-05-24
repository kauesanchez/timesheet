class CreateToothpastes < ActiveRecord::Migration
  def self.up
    create_table :toothpastes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :toothpastes
  end
end
