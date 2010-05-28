class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :user
      t.text :text
      t.string :report
      t.integer :question

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
