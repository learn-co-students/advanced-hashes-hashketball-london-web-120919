require "pry"

def game_hash
  game = {:home => {:team_name => "Brooklyn Nets",
                    :colors => ["Black", "White"],
                    :players => [{:player_name => "Alan Anderson",
                                    :number => 0,
                                    :shoe => 16,
                                    :points => 22,
                                    :rebounds => 12,
                                    :assists => 12,
                                    :steals => 3,
                                    :blocks => 1,
                                    :slam_dunks => 1 },
                                {:player_name => "Reggie Evans",
                                    :number => 30,
                                    :shoe => 14,
                                    :points => 12,
                                    :rebounds => 12,
                                    :assists => 12,
                                    :steals => 12,
                                    :blocks => 12,
                                    :slam_dunks => 7 },
                                {:player_name => "Brook Lopez",
                                    :number => 11,
                                    :shoe => 17,
                                    :points => 17,
                                    :rebounds => 19,
                                    :assists => 10,
                                    :steals => 3,
                                    :blocks => 1,
                                    :slam_dunks => 15 },
                                {:player_name => "Mason Plumlee",
                                    :number => 1,
                                    :shoe => 19,
                                    :points => 26,
                                    :rebounds => 11,
                                    :assists => 6,
                                    :steals => 3,
                                    :blocks => 8,
                                    :slam_dunks => 5 },
                                {:player_name => "Jason Terry",
                                    :number => 31,
                                    :shoe => 15,
                                    :points => 19,
                                    :rebounds => 2,
                                    :assists => 2,
                                    :steals => 4,
                                    :blocks => 11,
                                    :slam_dunks => 1 }]},
          :away => {:team_name => "Charlotte Hornets",
                    :colors => ["Turquoise", "Purple"],
                    :players => [{:player_name => "Jeff Adrien",
                                    :number => 4,
                                    :shoe => 18,
                                    :points => 10,
                                    :rebounds => 1,
                                    :assists => 1,
                                    :steals => 2,
                                    :blocks => 7,
                                    :slam_dunks => 2 },
                                {:player_name => "Bismack Biyombo",
                                    :number => 0,
                                    :shoe => 16,
                                    :points => 12,
                                    :rebounds => 4,
                                    :assists => 7,
                                    :steals => 22,
                                    :blocks => 15,
                                    :slam_dunks => 10 },
                                {:player_name => "DeSagna Diop",
                                    :number => 2,
                                    :shoe => 14,
                                    :points => 24,
                                    :rebounds => 12,
                                    :assists => 12,
                                    :steals => 4,
                                    :blocks => 5,
                                    :slam_dunks => 5 },
                                {:player_name => "Ben Gordon",
                                    :number => 8,
                                    :shoe => 15,
                                    :points => 33,
                                    :rebounds => 3,
                                    :assists => 2,
                                    :steals => 1,
                                    :blocks => 1,
                                    :slam_dunks => 0 },
                                {:player_name => "Kemba Walker",
                                    :number => 33,
                                    :shoe => 15,
                                    :points => 6,
                                    :rebounds => 12,
                                    :assists => 12,
                                    :steals => 7,
                                    :blocks => 5,
                                    :slam_dunks => 12 }]}}
end

def all_players
  game = game_hash
  players = []
  i = 0
  while i < game[:home][:players].length
    players << game[:home][:players][i]
    i += 1
  end
  i = 0
  while i < game[:away][:players].length
    players << game[:away][:players][i]
    i += 1
  end
  players
  # binding.pry
end

def num_points_scored(player)
  players = all_players
  i = 0
  while i < all_players.length do
    if all_players[i][:player_name] == player
      return all_players[i][:points]
    end
    i += 1
  end
end

def shoe_size(player)
  players = all_players
  i = 0
  while i < all_players.length do
    if all_players[i][:player_name] == player
      return all_players[i][:shoe]
    end
    i += 1
  end
end

def team_colors(team)
  game = game_hash
  if game[:home][:team_name] == team
    return game[:home][:colors]
  elsif game[:away][:team_name] == team
    return game[:away][:colors]
  else
    return "That team wasn't playing in this game"
  end
end

def team_names
  game = game_hash
  away_team = game[:away][:team_name]
  home_team = game[:home][:team_name]
  teams = [away_team, home_team]
end

def player_numbers(team)
  game = game_hash
  team_numbers = []
  if game[:home][:team_name] == team
    i = 0
    while i < game[:home][:players].length do
      team_numbers << game[:home][:players][i][:number]
      i += 1
    end
  elsif game[:away][:team_name] == team
    i = 0
    while i < game[:away][:players].length do
      team_numbers << game[:away][:players][i][:number]
      i += 1
    end
  else
    return "That team wasn't playing in this game"
  end
  team_numbers
end

def player_stats(player)
  players = all_players
  i = 0
  while i < all_players.length do
    if all_players[i][:player_name] == player
      stats = all_players[i]
      stats.shift
      return stats
    end
    i += 1
  end
end

def big_shoe_rebounds
  players = all_players
  biggest_shoe = players.max_by { |value| value[:shoe] }
  biggest_shoe[:rebounds]
end
