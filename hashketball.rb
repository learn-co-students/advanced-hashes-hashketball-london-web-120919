require 'pry'

def game_hash
  game_hash = { 
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"], 
    :players =>[
      {:player_name => "Alan Anderson",
       :number => 0,
       :shoe => 16,
       :points => 22,
       :rebounds => 12,
       :assists => 12,
       :steals => 3,
       :blocks => 1,
       :slam_dunks => 1
      },
      {:player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {:player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17, 
      :points => 17,
      :rebounds => 19, 
      :assists => 10, 
      :steals => 3, 
      :blocks => 1,
      :slam_dunks => 15
      },
      {:player_name => "Mason Plumlee",
       :number => 1,
       :shoe => 19,
       :points => 26,
       :rebounds => 11,
       :assists => 6,
       :steals => 3, 
       :blocks => 8,
       :slam_dunks => 5
      },
      {:player_name => "Jason Terry",
       :number => 31,
       :shoe => 15, 
       :points => 19,
       :rebounds => 2,
       :assists => 2,
       :steals => 4,
       :blocks => 11,
       :slam_dunks => 1
      }]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:player_name => "Jeff Adrien",
       :number => 4, 
       :shoe => 18,
       :points => 10,
       :rebounds => 1, 
       :assists => 1, 
       :steals => 2,
       :blocks => 7,
       :slam_dunks => 2
      },
      {:player_name => "Bismack Biyombo",
       :number => 0,
       :shoe => 16, 
       :points => 12,
       :rebounds => 4,
       :assists => 7,
       :steals => 22, 
       :blocks => 15,
       :slam_dunks => 10
      }, 
      {:player_name => "DeSagna Diop", 
       :number => 2,
       :shoe => 14,
       :points => 24,
       :rebounds => 12,
       :assists => 12,
       :steals => 4,
       :blocks => 5,
       :slam_dunks => 5 
      },
      {:player_name => "Ben Gordon",
       :number => 8,
       :shoe => 15,
       :points => 33,
       :rebounds => 3,
       :assists => 2,
       :steals => 1,
       :blocks => 1,
       :slam_dunks => 0
      },
      {:player_name => "Kemba Walker",
       :number => 33,
       :shoe => 15,
       :points => 6,
       :rebounds => 12,
       :assists => 12,
       :steals => 7,
       :blocks => 5,
       :slam_dunks => 12
      }]
  }}
end 

def num_points_scored(player_name)
  game_hash.each do |location, team|
    team.each do |key, values|
      if key == :players
        values.each do |player|
          if player[:player_name] == player_name
         return player[:points]
       end
     end
   end
 end
 end
 end
 
 def shoe_size(player_name)
   game_hash.each do |location, team|
     team.each do |key, values|
       if key == :players
         values.each do |player|
           if player[:player_name] == player_name
             return player[:shoe]
           end
         end
       end
     end
   end
 end
 
 def team_colors(team_name)
   game_hash.each do |location, team|
       if team[:team_name] == team_name
         return team[:colors]
     end
   end 
 end 

#def team_names
#teams_array = []
#game_hash.each do |location, team|
#  teams_array << team[:team_name]
#end
#teams_array
#end

def team_names
  game_hash.collect do |location, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  team_numbers = []
  game_hash.each do |location, teams|
    if teams[:team_name] == team_name
      teams.each do |attribute, players|
        if attribute == :players
        players.each do |player_name|
          team_numbers << player_name[:number]
        end
      end
    end
  end
end
 team_numbers
end

def player_stats(player_name)
  game_hash.each do |location, teams|
    teams[:players].each do |player|
      if player[:player_name] == player_name
        return {
          :assists => player[:assists],
          :blocks => player[:blocks],
          :number => player[:number],
          :points => player[:points],
          :rebounds => player[:rebounds],
          :shoe => player[:shoe],
          :slam_dunks => player[:slam_dunks],
          :steals => player[:steals]
        }
      end
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |location, team|
    players = team[:players]
    players.each do |player|
    shoe_sizes << player[:shoe]
   end
 end

largest_foot = shoe_sizes.max
game_hash.each do |location, team|
  players = team[:players]
  players.each do |player|
    if player[:shoe] == largest_foot
      return player[:rebounds]
  end
 end 
end 
end

def most_points_scored
  points = []
  game_hash.each do |location, team|
    players = team[:players]
    players.each do |player|
      points << player[:points]
    end
  end
  
  highest_score = points.max 
  game_hash.each do |location, team|
    players = team[:players]
    players.each do |player|
      if player[:points] == highest_score
        return player[:player_name]
      end
    end
  end
end

def winning_team 
  score_BN = 0
game_hash[:home][:players].each { |attribute| score_BN += attribute[:points]}

score_CH = 0
game_hash[:away][:players].each { |attribute| score_CH += attribute[:points]}

  if score_BN > score_CH
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
end
end

def player_with_longest_name
  name_array = []
  game_hash.each do |location, team|
    players = team[:players]
    players.each do |player|
      name_array << player[:player_name]
    end
  end
  name_array.sort_by{|name| name.length}.last
end
 
 def long_name_steals_a_ton?
  steals = []
  game_hash.each do |location, team|
    players = team[:players]
    players.each do |player|
      steals << player[:steals]
    end
  end
  
  highest_steals = steals.max 
  game_hash.each do |location, team|
    players = team[:players]
    players.each do |player|
      if player[:player_name] == player_with_longest_name && player[:steals] == highest_steals
         return true
      end
    end
  end
end
 


        
      









