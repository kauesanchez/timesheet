class CreateColgateImportants < ActiveRecord::Migration
  def self.up
    create_table :colgate_importants do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :colgate_importants
  end
end
