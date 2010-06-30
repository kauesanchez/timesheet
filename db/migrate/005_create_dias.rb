class CreateDias < ActiveRecord::Migration
  def self.up
    create_table :dias do |t|
      t.string :data
      t.references :user_id

      t.timestamps
    end
     Dia.create(:data=>'24/06/10')
  end

  def self.down
    drop_table :dias
  end
end
