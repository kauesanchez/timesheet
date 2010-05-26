class CreateAToothpastes < ActiveRecord::Migration
  def self.up
    create_table :a_toothpastes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :a_toothpastes
  end
end
