class CreatePeriodos < ActiveRecord::Migration
  def self.up
    create_table :periodos do |t|
      t.references :user_id
      t.string :entrada
      t.string :saida
      t.text :tarefa
      t.references :projeto_id
      t.references :dia_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :periodos
  end
end
