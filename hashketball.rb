require "pry"

def game_hash
  
  big_hash = {
    
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        #player 1
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
      },
        #player 2
        {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7 
      },
        #player 3
        {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15 
      },
        #player 4
        {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5 
      },
        #player 5
        {
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
        #player 1
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
      },
        #player 2
        {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10 
      },
        #player 3
        {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5 
      },
        #player 4
        {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0 
      },
        #player 5
        {
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
  
  big_hash
end

def num_points_scored(name)

  home_players_arr = game_hash[:home][:players]
  away_players_arr = game_hash[:away][:players]
  
  i = 0
  while i < home_players_arr.length do
  # loop over home team's players names, see if the name exists...
    #...if so, return points of that player
    if home_players_arr[i][:player_name] == name
      return home_players_arr[i][:points]
    else
      # ...if not, loop over away team's player names, do the same
      j = 0
      while j < away_players_arr.length do
        if away_players_arr[j][:player_name] == name
          return away_players_arr[j][:points]
        end
      j += 1
      end
    end
  i += 1
  end
end

def shoe_size(name)
  home_players_arr = game_hash[:home][:players]
  away_players_arr = game_hash[:away][:players]

  home_players_arr.each do |arr_index|
    if arr_index[:player_name] == name
      return arr_index[:shoe]
      
    else
      
      away_players_arr.each do |arr_index|
        if arr_index[:player_name] == name
          return arr_index[:shoe]
        end
      end
    end
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  team_name_arr = [] 
  game_hash.each do |key, another_hash|
    team_name_arr << another_hash[:team_name]
  end
  team_name_arr
end

def player_numbers(team)
  num_arr = []
  
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |arr_index|
      num_arr << arr_index[:number]
    end
  else
    game_hash[:away][:players].each do |arr_index|
      num_arr << arr_index[:number]
    end
  end
  
  num_arr
end

def player_stats(name)
  player_hash = {}
  
  game_hash[:home][:players].each do |arr_index|
    if arr_index[:player_name] == name
      player_hash = {
        :number => arr_index[:number],
        :shoe => arr_index[:shoe],
        :points => arr_index[:points],
        :rebounds => arr_index[:rebounds],
        :assists => arr_index[:assists],
        :steals => arr_index[:steals],
        :blocks => arr_index[:blocks],
        :slam_dunks => arr_index[:slam_dunks]
      }
    else
      game_hash[:away][:players].each do |arr_index|
        if arr_index[:player_name] == name
            player_hash = {
              :number => arr_index[:number],
              :shoe => arr_index[:shoe],
              :points => arr_index[:points],
              :rebounds => arr_index[:rebounds],
              :assists => arr_index[:assists],
              :steals => arr_index[:steals],
              :blocks => arr_index[:blocks],
              :slam_dunks => arr_index[:slam_dunks]
            }
        end
      end
    end
  end
  player_hash
end

def big_shoe_rebounds
  home_big_shoe_size = 0
  away_big_shoe_size = 0
  
  home_big_shoe_rebound = 0
  away_big_shoe_rebound = 0
  
  game_hash[:home][:players].each do |arr_index|
    if arr_index[:shoe] > home_big_shoe_size
      home_big_shoe_size = arr_index[:shoe]
      home_big_shoe_rebound = arr_index[:rebounds]
    end
  end
  
  game_hash[:away][:players].each do |arr_index|
    if arr_index[:shoe] > away_big_shoe_size
     away_big_shoe_size = arr_index[:shoe]
     away_big_shoe_rebound = arr_index[:rebounds]
    end
  end
  
  #now we have biggest shoe sizes from each team
  if home_big_shoe_size > away_big_shoe_size
    return home_big_shoe_rebound
  else
    return away_big_shoe_rebound
  end
end

def most_points_scored
  home_biggest_points = 0
  away_biggest_points = 0
  
  home_biggest_player = ""
  away_biggest_player = ""
  
  home_players_arr = game_hash[:home][:players]
  away_players_arr = game_hash[:away][:players]
  
  home_players_arr.each do |arr_index|
    if arr_index[:points] > home_biggest_points
      home_biggest_points = arr_index[:points]
      home_biggest_player = arr_index[:player_name]
    end
  end
  
  away_players_arr.each do |arr_index|
    if arr_index[:points] > away_biggest_points
      away_biggest_points = arr_index[:points]
      away_biggest_player = arr_index[:player_name]
    end
  end
  
  if home_biggest_points > away_biggest_points
    return home_biggest_player
  else
    return away_biggest_player
  end
end

def winning_team
  home_points = 0
  away_points = 0
  
  home_players_arr = game_hash[:home][:players]
  away_players_arr = game_hash[:away][:players]
  
  home_players_arr.each do |arr_index|
    home_points += arr_index[:points]
  end
  
  away_players_arr.each do |arr_index|
    away_points += arr_index[:points]
  end
  
  if home_points > away_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  home_longest_name = ""
  away_longest_name = ""
  
  home_players_arr = game_hash[:home][:players]
  away_players_arr = game_hash[:away][:players]
  
  home_players_arr.each do |arr_index|
    if arr_index[:player_name].length > home_longest_name.length
      home_longest_name = arr_index[:player_name]
    end
  end
  
  away_players_arr.each do |arr_index|
    if arr_index[:player_name].length > away_longest_name.length
      away_longest_name = arr_index[:player_name]
    end
  end
  
  if home_longest_name.length > away_longest_name.length
    return home_longest_name
  else
    return away_longest_name
  end
end

def long_name_steals_a_ton?
  long_name_player = player_with_longest_name
  
  home_most_steals = 0
  away_most_steals = 0
  
  home_steals_player = ""
  away_steals_player = ""
  
  home_players_arr = game_hash[:home][:players]
  away_players_arr = game_hash[:away][:players]
  
  home_players_arr.each do |arr_index|
    if arr_index[:steals] > home_most_steals
      home_most_steals = arr_index[:steals]
      home_steals_player = arr_index[:player_name]
    end
  end
  
  away_players_arr.each do |arr_index|
    if arr_index[:steals] > away_most_steals
      away_most_steals = arr_index[:steals]
      away_steals_player = arr_index[:player_name]
    end
  end
  
  if home_most_steals > away_most_steals
    if home_steals_player == long_name_player
      return true
    end
  else
    if away_steals_player == long_name_player
      return true
    end
  end
end
