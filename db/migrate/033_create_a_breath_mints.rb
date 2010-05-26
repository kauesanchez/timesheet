class CreateABreathMints < ActiveRecord::Migration
  def self.up
    create_table :a_breath_mints do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :a_breath_mints
  end
end
