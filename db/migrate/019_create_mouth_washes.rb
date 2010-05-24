class CreateMouthWashes < ActiveRecord::Migration
  def self.up
    create_table :mouth_washes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mouth_washes
  end
end
