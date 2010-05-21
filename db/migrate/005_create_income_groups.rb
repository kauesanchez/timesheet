class CreateIncomeGroups < ActiveRecord::Migration
  def self.up
    create_table :income_groups do |t|
      t.integer :value
      t.string :label

      t.timestamps
    end
  end

  def self.down
    drop_table :income_groups
  end
end
