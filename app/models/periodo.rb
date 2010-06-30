class Periodo < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :projeto_id
  
  
  validates_presence_of :tarefa, :message=>": por favor descreva a tarefa"
  validates_presence_of :entrada, :message=>": por favor escreva a hora de entrada"
  validates_presence_of :saida, :message=>": por favor escreva a hora de saida"
  
end
