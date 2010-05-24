class CreateAgeGroups < ActiveRecord::Migration
  def self.up
    create_table :age_groups do |t|
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
  end

  def self.down
    drop_table :age_groups
  end
end
