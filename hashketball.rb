# Write your code here!

def make_player(pname, num, shoe, points, rebounds, ass, stl, blk, sd)
	return {
		:player_name => pname,
		:number => num,
		:shoe => shoe,
		:points => points,
		:rebounds => rebounds,
		:assists => ass,
		:steals => stl,
		:blocks => blk,
		:slam_dunks => sd
	}
end

def game_hash
	home = {
		:team_name => "Brooklyn Nets",
		:colors    => ["Black", "White"],
		:players   => [
			make_player("Alan Anderson",  0, 16, 22, 12, 12,  3,  1,  1),
			make_player("Reggie Evans",  30, 14, 12, 12, 12, 12, 12,  7),
			make_player("Brook Lopez",   11, 17, 17, 19, 10,  3,  1, 15),
			make_player("Mason Plumlee",  1, 19, 26, 11,  6,  3,  8,  5),
			make_player("Jason Terry",   31, 15, 19,  2,  2,  4, 11,  1)
		]
	}
	away = {
		:team_name => "Charlotte Hornets",
		:colors => ["Turquoise", "Purple"],
		:players =>[
			make_player("Jeff Adrien",     4, 18, 10,  1,  1,  2,  7,  2),
			make_player("Bismack Biyombo", 0, 16, 12,  4,  7, 22, 15, 10),
			make_player("DeSagna Diop",    2, 14, 24, 12, 12,  4,  5,  5),
			make_player("Ben Gordon",      8, 15, 33,  3,  2,  1,  1,  0),
			make_player("Kemba Walker",   33, 15,  6, 12, 12,  7,  5, 12)
		]
	}
	return {:home => home, :away => away}
end

def all_players
	gh = game_hash()
 	gh[:home][:players] + gh[:away][:players]
end

def num_points_scored(pname)
	players = all_players()
	play = players.find {|p| p[:player_name] == pname}
	return play[:points]
end

def shoe_size(pname)
	players = all_players()
	play = players.find {|p| p[:player_name] == pname}
	return play[:shoe]
end

def team_names
  gh = game_hash()
  return [gh[:away][:team_name], gh[:home][:team_name]]
end

def team_colors(tname)
  gh = game_hash()
  if gh[:home][:team_name] == tname
    return gh[:home][:colors]
  elsif gh[:away][:team_name] == tname
    return gh[:away][:colors]
  else #should only happen of bad team name is given
    return []
  end
end

def player_numbers(tname)
  gh = game_hash()
  players = []
  if gh[:home][:team_name] == tname
    players = gh[:home][:players]
  elsif gh[:away][:team_name] == tname
    players = gh[:away][:players]
  end
  players.map {|p| p[:number]}
end

def player_stats(pname)
  play = all_players().find{|p| p[:player_name] == pname }
  return {
    :number     => play[:number],
    :shoe       => play[:shoe],
    :points     => play[:points],
    :rebounds   => play[:rebounds],
    :assists    => play[:assists],
    :steals     => play[:steals],
    :blocks     => play[:blocks],
    :slam_dunks => play[:slam_dunks]
  }
end

def big_shoe_rebounds
  players = all_players()
  bigfoot = players.max_by{|p| p[:shoe] }
  return bigfoot[:rebounds]
end

def most_points_scored
  mvp = all_players().max_by{|p| p[:points]}
  return mvp[:player_name]
end

def winning_team
  gh = game_hash
  home_points = gh[:home][:players].map{|p| p[:points]}
  home_score = home_points.reduce(0){|a,b| a+b}
  away_points = gh[:away][:players].map{|p| p[:points]}
  away_score = away_points.reduce(0){|a,b| a+b}
  if home_score > away_score
    return gh[:home][:team_name]
  else
    return gh[:away][:team_name]
  end
end

def player_with_longest_name
  players = all_players()
  longname = players.max_by{|p| p[:player_name].length}
  return longname[:player_name]
end

def long_name_steals_a_ton?
  longname = player_with_longest_name()
  stealer = all_players().max_by{|p| p[:steals]}
  return (stealer[:player_name] == longname)
end

