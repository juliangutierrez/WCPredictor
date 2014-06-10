# ruby encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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

Team::GROUPS.each do |group|
	teams = Team.send("group_#{group}").to_a	
	teams.combination(2).to_a.each do |game_array|
		Game.create(team1: game_array.first, team2: game_array.last, stage: 1)
	end
end