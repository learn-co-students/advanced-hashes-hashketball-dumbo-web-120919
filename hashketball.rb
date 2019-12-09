def game_hash 
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      { :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1 },
      { :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7 },
      { :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15 },
      { :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5 },
      { :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1 },
      ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      { :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2 },
      { :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10 },
      { :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5 },
      { :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0 },
      { :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12 },
      ]
  }
}
end

def num_points_scored(wanted_player_name)
  game_hash.each do |team, info|
    info.each do |players, list|
      next unless players == :players
      
      list.each do |player|
        return player[:points] if player[:player_name] == wanted_player_name
      end
    end
  end
end

def shoe_size(wanted_player_name)
  game_hash.each do |team, info|
    info.each do |players, list|
      next unless players == :players
      
      list.each do |player|
        return player[:shoe] if player[:player_name] == wanted_player_name
      end
    end
  end
end

def team_colors(wanted_team_name)
  game_hash.each do |team, info|
    return game_hash[team][:colors] if info[:team_name] == wanted_team_name
  end
end

def team_names
  game_hash.collect do |team, info|
    info[:team_name]
  end
end

def player_numbers(wanted_team_name)
  jersey_nums = []
  game_hash.each do |team, info|
    next unless info[:team_name] == wanted_team_name
    
    info.each do |attribute, list|
      next unless attribute == :players
      
      list.each do |numbers|
        jersey_nums << numbers[:number]
      end
    end
  end
  jersey_nums
end

def player_stats(wanted_player_name)
  player_stats_hash = {}
  game_hash.each do |team, info|
    info.each do |attribute, data|
      next unless attribute == :players
      
      game_hash[team][attribute].each do |player|
        next unless player[:player_name] == wanted_player_name
        
        player_stats_hash = player.delete_if do |key, value|
          key == :player_name
        end
      end
    end
  end
  player_stats_hash
end

def big_shoe_rebounds
  biggest_shoe = 0
  num_rebounds = 0

  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        num_rebounds = player[:rebounds]
      end
    end
  end

  num_rebounds
end

def most_points_scored
  points_scored = 0
  player_name = ""

  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      if player[:points] > points_scored
        points_scored = player[:points]
        player_name = player[:player_name]
      end
    end
  end
  return player_name
end

def winning_team
  home_team_points = 0 
  away_team_points = 0 
  
  game_hash.each do |team, info|
    if team == :home 
      info[:players].each do |player|
        home_team_points += player[:points]
      end
    elsif team == :away 
      info[:players].each do |player|
        away_team_points += player[:points]
      end
    end
  end
  
  if home_team_points > away_team_points
    return game_hash[:home][:team_name]
  elsif away_team_points > home_team_points
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name_length = 0
  player_name = ""
  
  game_hash.each do |team, game_data|
    game_data[:players].each do |player|
      if player[:player_name].length > longest_name_length
        longest_name_length = player[:player_name].length
        player_name = player[:player_name]
      end
    end
  end
  return player_name
end

def long_name_steals_a_ton?
  longest_name_length = 0
  longest_player_name = ""
  
  game_hash.each do |team, game_data|
    game_data[:players].each do |player|
      if player[:player_name].length > longest_name_length
        longest_name_length = player[:player_name].length
        longest_player_name = player[:player_name]
      end
    end
  end
  
  most_steals = 0
  steals_player_name = ""

  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      if player[:steals] > most_steals
        most_steals = player[:steals]
        steals_player_name = player[:player_name]
      end
    end
  end
  
  if longest_player_name == steals_player_name
    return true 
  end
    
end
  


