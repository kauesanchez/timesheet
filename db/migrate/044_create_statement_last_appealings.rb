class CreateStatementLastAppealings < ActiveRecord::Migration
  def self.up
    create_table :statement_last_appealings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :statement_last_appealings
  end
end
