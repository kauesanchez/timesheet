class CreateFlossCares < ActiveRecord::Migration
  def self.up
    create_table :floss_cares do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :floss_cares
  end
end
