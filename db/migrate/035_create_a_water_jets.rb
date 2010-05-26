class CreateAWaterJets < ActiveRecord::Migration
  def self.up
    create_table :a_water_jets do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :a_water_jets
  end
end
