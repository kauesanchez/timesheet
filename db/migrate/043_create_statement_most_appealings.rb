class CreateStatementMostAppealings < ActiveRecord::Migration
  def self.up
    create_table :statement_most_appealings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :statement_most_appealings
  end
end
