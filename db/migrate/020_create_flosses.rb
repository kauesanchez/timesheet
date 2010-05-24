class CreateFlosses < ActiveRecord::Migration
  def self.up
    create_table :flosses do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :flosses
  end
end
