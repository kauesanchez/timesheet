class CreateWhiteningKits < ActiveRecord::Migration
  def self.up
    create_table :whitening_kits do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :whitening_kits
  end
end
