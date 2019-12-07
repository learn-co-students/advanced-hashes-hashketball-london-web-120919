require "pp"

def game_hash()
  data = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        { :player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        { :player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        { :player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        { :player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        { :player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        { :player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        { :player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
        { :player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        { :player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        { :player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
      ]
    }
  }
end

def get_player(player_name)
  players = get_players()
  
  found_player = players.find { |player| player[:player_name] == player_name }
    
  if found_player
    return found_player
  end
end

def num_points_scored(player_name)
  get_player(player_name)[:points]
end

def shoe_size(player_name)
  get_player(player_name)[:shoe]
end

def team_colors(team_name)
  data = game_hash()
  
  data.each { |designation, team| 
    if team[:team_name] == team_name
      return team[:colors]
    end
  }
end

def get_teams()
  data =game_hash()
  
  data.reduce([]) { |memo, (designation, team)| 
    memo << team
    memo
  }
end

def team_names()
  data = get_teams()
  
  data.map { |team| team[:team_name] }
end

def player_numbers(team_name)
  data = get_teams()
  
  found_team = data.find { |team| team[:team_name] == team_name }
  
  if found_team
      return found_team[:players].map { |player| player[:number]}
  end
end

def player_stats(player_name)
  player = get_player(player_name)
  
  return {
    :number => player[:number],
    :shoe => player[:shoe],
    :points => player[:points],
    :rebounds => player[:rebounds],
    :assists =>  player[:assists],
    :steals => player[:steals],
    :blocks => player[:blocks],
    :slam_dunks => player[:slam_dunks]
  }
end

def get_players()
  teams = get_teams()
  teams.reduce([]) { |memo, team| 
    team[:players].each { |player| memo << player }
    memo
  }
end

def big_shoe_rebounds()
  players = get_players() 
  
  biggest_player = players.max_by {|player| player[:shoe]}
  biggest_player[:rebounds]
end

def most_points_scored()
  players = get_players() 
  
  best_player = players.max_by {|player| player[:points]}
  best_player[:player_name]
end

def winning_team()
  teams = get_teams()
  
  teams_with_score = teams.map { |team| 
    team[:score] = team[:players].reduce(0) { |memo, player|
      memo += player[:points]
    }
    team
  }
  
  winning_team = teams_with_score.max_by { |team| team[:score] }
  winning_team[:team_name]
end

def player_with_longest_name()
  players = get_players()
  
  found_player = players.max_by { |player| player[:player_name].length }
  found_player[:player_name]
end

def long_name_steals_a_ton?()
  players = get_players()
  
  stealing_player = players.max_by { |player| player[:steals] }
  stealing_player[:player_name] == player_with_longest_name()
end