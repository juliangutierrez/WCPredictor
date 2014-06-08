# encoding: UTF-8
class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :group

      t.timestamps
    end
    Team.create :name => 'Brasil', :group => 'A'
    Team.create :name => 'Croácia', :group => 'A'
    Team.create :name => 'México', :group => 'A'
    Team.create :name => 'Camarões', :group => 'A'
    Team.create :name => 'Espanha', :group => 'B'
    Team.create :name => 'Holanda', :group => 'B'
    Team.create :name => 'Chile', :group => 'B'
    Team.create :name => 'Austrália', :group => 'B'
    Team.create :name => 'Colômbia', :group => 'C'
    Team.create :name => 'Grécia', :group => 'C'
    Team.create :name => 'Costa do Marfim', :group => 'C'
    Team.create :name => 'Japão', :group => 'C'
    Team.create :name => 'Uruguai', :group => 'D'
    Team.create :name => 'Costa Rica', :group => 'D'
    Team.create :name => 'Inglaterra', :group => 'D'
    Team.create :name => 'Itália', :group => 'D'
    Team.create :name => 'Suiça', :group => 'E'
    Team.create :name => 'Equador', :group => 'E'
    Team.create :name => 'França', :group => 'E'
    Team.create :name => 'Honduras', :group => 'E'
    Team.create :name => 'Argentina', :group => 'F'
    Team.create :name => 'Bósnia e Herzegovina', :group => 'F'
    Team.create :name => 'Irã', :group => 'F'
    Team.create :name => 'Nigéria', :group => 'F'
    Team.create :name => 'Alemanha', :group => 'G'
    Team.create :name => 'Portugal', :group => 'G'
    Team.create :name => 'Gana', :group => 'G'
    Team.create :name => 'Estados Unidos', :group => 'G'
    Team.create :name => 'Bélgica', :group => 'H'
    Team.create :name => 'Algéria', :group => 'H'
    Team.create :name => 'Rússia', :group => 'H'
    Team.create :name => 'Coréia do Sul', :group => 'H'
  end
end
