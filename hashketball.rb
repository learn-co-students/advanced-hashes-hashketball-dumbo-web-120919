# Write your code here!
require 'pry'

def game_hash 
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
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
      },
    ]
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
      },
    ]
  }
}
end

def num_points_scored(player)
  game_hash.each do |teamHome, teamInfo|
   teamInfo.each do |playerList, playerInfo|
       if playerList == :players
         playerInfo.each do |playerName|
           if playerName[:player_name] == player
                 return playerName[:points]
end
end
end
end
end
end

def shoe_size(player)
  game_hash.each do |teamHome, teamInfo|
   teamInfo.each do |playerList, playerInfo|
       if playerList == :players
         playerInfo.each do |playerName|
           if playerName[:player_name] == player
                 return playerName[:shoe]
end
end
end
end
end
end

def team_colors(teamName)
  game_hash.each do |teamHome, teamInfo|
    if teamInfo[:team_name] == teamName
    return teamInfo[:colors]
end
end
end

def team_names
  game_hash.map do |teamHome, teamInfo|
    teamInfo[:team_name]
  end
end

def player_numbers(teamName)
  playerNumberArray = []
  game_hash.each do |teamHome, teamInfo|
    if teamInfo[:team_name] == teamName
      teamInfo.each do |playerList, playerInfo|
        if playerList == :players
    playerInfo.each do |playerNumber|
    playerNumberArray << playerNumber[:number]
    end
    end
  end
end
end
playerNumberArray
end

def player_stats(player) 
    playerStats = {}
    game_hash.each do |teamHome, teamInfo|
   teamInfo.each do |playerList, playerInfo|
if playerList == :players 
  playerInfo.each do |playerName|
    if playerName[:player_name] == player 
      playerStats = playerName.delete_if do |deleteThis, otherStats|
        deleteThis == :player_name
end
end
end
end
end
end
playerStats
end

def big_shoe_rebounds
  bigShoe = 0
  rebounds = 0
  game_hash.each do |teamHome, teamInfo|
    teamInfo[:players].each do |player|
      size = player[:shoe]
      if size > bigShoe
        bigShoe = size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  mostPoints = 0
  mostPointsPlayer = ""
  game_hash.each do |teamHome, teamInfo|
    teamInfo[:players].each do |player|
      points = player[:points]
      if points > mostPoints
        mostPoints = points
        mostPointsPlayer = player[:player_name]
      end
    end
  end
  mostPointsPlayer
end

def winning_team
  total = 0
  winners = ""
  game_hash.each do |teamHome, teamInfo|
    teamPoints = 0
    teamName = game_hash[teamHome][:team_name]
    teamInfo[:players].each do |player|
      points = player[:points]
      teamPoints += points
    end
    winners, total = teamName, teamPoints if teamPoints > total
  end
  return winners
end

def player_with_longest_name
  longestName = ""
  longestNameLength = 0
  game_hash.each do |teamHome, teamInfo|
    teamInfo[:players].each do |player|
      nameLength = player[:player_name].length
      longestName, longestNameLength = player[:player_name], nameLength if nameLength > longestNameLength
    end
  end
  return longestName
end

def long_name_steals_a_ton?
  finesser = ''
  finesseCount = 0
  game_hash.each do |teamHome, teamInfo|
    teamInfo[:players].each do |player|
      finesser, finesseCount = player[:player_name], player[:steals] if player[:steals] > finesseCount
    end
  end
  return true if finesser == player_with_longest_name
end