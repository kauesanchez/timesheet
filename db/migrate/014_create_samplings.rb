class CreateSamplings < ActiveRecord::Migration
  def self.up
    create_table :samplings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :samplings
  end
end
