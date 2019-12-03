:home => {
  :team_name => "Brooklyn Nets",
  :colors => [],
  :players => [
    {
    :player_name => "",
    :number => ,
    :shoe => ,
    :points => ,
    :rebounds => ,
    :assists => ,
    :steals => ,
    :blocks => ,
    :slam_dunks =>
  },
  ]

#####-------------  print a phrase with info from all the players
  def acces_players(game_hash,playerName=nil)
  game_hash.each { |homeOrAway,value|
    value[:players].each { |pEach|
      p "#{pEach[:player_name]} has #{pEach[:points]} points"
    }
  }
end
