def game_hash
# rspec spec/hashketball_spec.rb -e game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },{
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },{
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },{
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },{
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },{
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        },{
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },{
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },{
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
        }
      ]
    }
}
end

# def acces_players(game_hash)
#   game_hash.each { |homeOrAway|
#       game_hash[homeOrAway][:players]
#     }
# end

def num_points_scored(playerName)
#     knows the number of points scored by each player (FAILED - 1)
#rspec spec/hashketball_spec.rb -e num_points_scored

game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      if pEach[:player_name].include?(playerName)
      return pEach[:points]
      end
    }
  }
end

def shoe_size(playerName)
#     knows the shoe size of each player (FAILED - 2)
game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      if pEach[:player_name].include?(playerName)
      return pEach[:shoe]
      end
    }
  }
end

def team_colors(teamName)
game_hash.each { |homeOrAway,value|
      if value[:team_name].include?(teamName)
      return value[:colors]
      end
  }
end
def team_names
newArr = []
  game_hash.each { |homeOrAway,value|
    newArr.push(value[:team_name])
  }
  newArr
end

def player_numbers(teamName)
newArr = []
  game_hash.each { |homeOrAway,value|
    if value[:team_name] == teamName
      value[:players].each { |e|
      newArr.push(e[:number])
      }
    end
  }
return newArr
end

def player_stats(playerName)
  newHash = {}
    game_hash.each { |homeOrAway,value|
      value[:players].each { |pEach|
        if pEach[:player_name].include?(playerName)
        newHash.merge!(pEach)
        newHash.delete(:player_name)
        end
      }
    }
newHash
end

def big_shoe_rebounds
newArr = []
  game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      newArr.push(pEach[:shoe])
    }
  }
  game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      if newArr.max == pEach[:shoe]
        return pEach[:rebounds]
      end
    }
  }
end

def most_points_scored
#     returns Ben Gordon (FAILED - 8)
newArr = []
  game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      newArr.push(pEach[:points])

    }
  }
  game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      if newArr.max == pEach[:points]
        return pEach[:player_name]
      end
    }
  }

end

def winning_team
homePoints = 0
awayPoints = 0
  game_hash[:home][:players].each { |e|
    homePoints += e[:points]
  }
    game_hash[:away][:players].each { |e|
    awayPoints += e[:points]
  }
  if homePoints > awayPoints
    return game_hash[:home][:team_name]
  elsif awayPoints > homePoints
    return game_hash[:away][:team_name]
  else
    "it was a tie"
  end
end

def player_with_longest_name
newArr = []

  game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      newArr.push(pEach[:player_name])
    }
  }
  newArr.max_by { |a| a.length}

end

#######   my code
def most_points_stolen
newArr = []
  game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      newArr.push(pEach[:steals])

    }
  }
  game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      if newArr.max == pEach[:steals]
        return pEach[:player_name]
      end
    }
  }

end

def long_name_steals_a_ton?
  most_points_stolen == player_with_longest_name
end

#   #player_with_longest_name
#     returns Bismack Biyombo (FAILED - 10)
#   #player_with_longest_name
#     returns Bismack Biyombo (FAILED - 10)
# super bonus
#   #long_name_steals_a_ton?
#     returns true (FAILED - 11)
