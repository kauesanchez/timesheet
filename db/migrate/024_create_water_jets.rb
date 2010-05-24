class CreateWaterJets < ActiveRecord::Migration
  def self.up
    create_table :water_jets do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :water_jets
  end
end
