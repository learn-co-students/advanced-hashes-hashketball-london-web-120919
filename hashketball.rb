def game_hash
    game_hash = {
        home: {
            team_name: 'Brooklyn Nets',
            colors: ['Black', 'White'],
            players: [{
                player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1
            },
            {
                player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7
            },
            {
                player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
            },
            {
                player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
            },
            {
                player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1
            }
        ]
        },
        away: {
            team_name: 'Charlotte Hornets',
            colors: ['Turquoise', 'Purple'],
            players: [{
                player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2
            },
            {
                player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10
            },
            {
                player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
            },
            {
                player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
            },
            {
                player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12
            }
        ]
        }
    }
end


def player_list(team='all')
    if team == 'home'
        return  game_hash[:home][:players]
    elsif team == 'away'
        return  game_hash[:away][:players]
    elsif team == 'all'
        return game_hash[:home][:players].concat(game_hash[:away][:players])
    end
end

def num_points_scored(player)
player = player_list.select { |e| e[:player_name] == player}[0][:points]
end

def shoe_size(player)
    player = player_list.select { |e| e[:player_name] == player}[0][:shoe]
end

def team_colors(team)
    if game_hash[:home][:team_name] == team
        return game_hash[:home][:colors]
    else
        return game_hash[:away][:colors]
    end
end

def team_names
    [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
    player_numbers = []
    if game_hash[:home][:team_name] == team
        player_list = player_list("home")
    else
        player_list = player_list("away")
    end
    player_list.each { |k, v|player_numbers.push(k[:number]) }
    player_numbers
end

def player_stats(player)
    player = player_list.select { |e| e[:player_name] == player}[0]
    player.shift
    player
end

def if_something_then_something_players(if_something, then_something)
    first_thing = 0
    next_thing = 0
    player_list.map { |e| 
        if e[if_something] > first_thing
            first_thing = e[if_something]
            next_thing = e[then_something]
        end
    }
    next_thing
end

def big_shoe_rebounds
    if_something_then_something_players(:shoe, :rebounds)
end

def most_points_scored
if_something_then_something_players(:points, :player_name)
end

def winning_team
    home_team_points = 0
    away_team_points = 0

    player_list('home').map { |e| home_team_points += e[:points]}
    player_list('away').map { |e| away_team_points += e[:points]}

    home_team_points > away_team_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]

end

def player_with_longest_name
    name_length = 0
    name = ''
    player_list.map { |e| 
        if e[:player_name].length > name_length
            name_length = e[:player_name].length
            name = e[:player_name]
        end
    }
    name
end

def long_name_steals_a_ton?
    longest_name = player_with_longest_name
    most_steals = if_something_then_something_players(:steals, :player_name)

    longest_name == most_steals ? true : false
end