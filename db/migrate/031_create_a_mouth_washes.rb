class CreateAMouthWashes < ActiveRecord::Migration
  def self.up
    create_table :a_mouth_washes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :a_mouth_washes
  end
end
