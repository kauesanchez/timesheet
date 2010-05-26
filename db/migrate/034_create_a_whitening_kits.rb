class CreateAWhiteningKits < ActiveRecord::Migration
  def self.up
    create_table :a_whitening_kits do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :a_whitening_kits
  end
end
