class CreateBreathMints < ActiveRecord::Migration
  def self.up
    create_table :breath_mints do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :breath_mints
  end
end
