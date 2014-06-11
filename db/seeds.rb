# ruby encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.create :name => 'Brasil', :group => 'A', :img => 'bra'
Team.create :name => 'Croácia', :group => 'A', :img => 'cro'
Team.create :name => 'México', :group => 'A', :img => 'mex'
Team.create :name => 'Camarões', :group => 'A', :img => 'cam'
Team.create :name => 'Espanha', :group => 'B', :img => 'esp'
Team.create :name => 'Holanda', :group => 'B', :img => 'hol'
Team.create :name => 'Chile', :group => 'B', :img => 'chi'
Team.create :name => 'Austrália', :group => 'B', :img => 'aus'
Team.create :name => 'Colômbia', :group => 'C', :img => 'col'
Team.create :name => 'Grécia', :group => 'C', :img => 'gre'
Team.create :name => 'Costa do Marfim', :group => 'C', :img => 'cdm'
Team.create :name => 'Japão', :group => 'C', :img => 'jap'
Team.create :name => 'Uruguai', :group => 'D', :img => 'uru'
Team.create :name => 'Costa Rica', :group => 'D', :img => 'cos'
Team.create :name => 'Inglaterra', :group => 'D', :img => 'ing'
Team.create :name => 'Itália', :group => 'D', :img => 'ita'
Team.create :name => 'Suiça', :group => 'E', :img => 'sui'
Team.create :name => 'Equador', :group => 'E', :img => 'ecu'
Team.create :name => 'França', :group => 'E', :img => 'fra'
Team.create :name => 'Honduras', :group => 'E', :img => 'hon'
Team.create :name => 'Argentina', :group => 'F', :img => 'arg'
Team.create :name => 'Bósnia e Herzegovina', :group => 'F', :img => 'bos'
Team.create :name => 'Irã', :group => 'F', :img => 'ira'
Team.create :name => 'Nigéria', :group => 'F', :img => 'nig'
Team.create :name => 'Alemanha', :group => 'G', :img => 'ale'
Team.create :name => 'Portugal', :group => 'G', :img => 'por'
Team.create :name => 'Gana', :group => 'G', :img => 'gan'
Team.create :name => 'Estados Unidos', :group => 'G', :img => 'eua'
Team.create :name => 'Bélgica', :group => 'H', :img => 'bel'
Team.create :name => 'Algéria', :group => 'H', :img => 'alg'
Team.create :name => 'Rússia', :group => 'H', :img => 'rus'
Team.create :name => 'Coréia do Sul', :group => 'H', :img => 'cor'

Team::GROUPS.each do |group|
	teams = Team.send("group_#{group}").to_a	
	teams.combination(2).to_a.each do |game_array|
		Game.create(team1: game_array.first, team2: game_array.last, stage: 1)
	end
end