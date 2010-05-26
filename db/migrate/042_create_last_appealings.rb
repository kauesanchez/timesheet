class CreateLastAppealings < ActiveRecord::Migration
  def self.up
    create_table :last_appealings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :last_appealings
  end
end
