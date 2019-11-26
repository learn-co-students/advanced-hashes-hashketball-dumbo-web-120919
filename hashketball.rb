require "pry"

def game_hash
{:home =>
    {
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
        }
        ] 
    },
:away =>
    {
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
        }
        ]   
    }
}

end


def num_points_scored(name)
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:player_name] == name
                return player[:points]
            end
        end
    end
end


def shoe_size(name)
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:player_name] == name
                return player[:shoe]
            end
        end
    end
end


def team_colors(team_name)
    game_hash.each do |team, team_info|
        if team_info[:team_name] == team_name
            return team_info[:colors]
        end 
    end
end


def team_names
    game_hash.map do |team, team_info|
        team_info[:team_name]
    end
end


def player_numbers(team_name)
    jersey_numbers = []
    game_hash.each do |team, team_info|
        if team_info[:team_name] == team_name
           team_info[:players].each do |player|
                jersey_numbers << player[:number]
           end
        end
    end
    jersey_numbers
end

def player_stats(name)
    stats_hash ={}
    game_hash.each do |team, team_info|        
        team_info[:players].each do |player|
            if player[:player_name] == name
                stats_hash = player.delete_if do |key, value|
                    key == :player_name
                end
            end
        end
    end
    stats_hash
end


def big_shoe_rebounds
    biggest_shoe_size = 0
    biggest_foot = ""
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:shoe] > biggest_shoe_size
                biggest_shoe_size = player[:shoe]
                biggest_foot = player[:player_name]
            end
        end
    end
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:player_name] == biggest_foot
                return player[:rebounds]
            end
        end
    end
end


def most_points_scored
    points_scored = 0
    high_scorer = ""
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:points] > points_scored
                points_scored = player[:points]
                high_scorer = player[:player_name]
            end
        end
    end
    high_scorer
end

def winning_team
    home_total = 0
    away_total = 0
    game_hash[:home][:players].each do |player|
        home_total += player[:points]
    end

    game_hash[:away][:players].each do |player|
        away_total += player[:points]
    end

    if home_total > away_total
        return game_hash[:home][:team_name]
    else
        return game_hash[:away][:team_name]
    end
end


def player_with_longest_name
    name_length = 0
    longest_name = ""
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:player_name].length > name_length
                name_length = player[:player_name].length
                longest_name = player[:player_name]
            end 
        end
    end
    longest_name
end

def long_name_steals_a_ton?
    name_length = 0
    longest_name = ""
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:player_name].length > name_length
                name_length = player[:player_name].length
                longest_name = player[:player_name]
            end 
        end
    end

    number_of_steals = 0
    high_stealer = ""
    game_hash.each do |team, team_info|
        team_info[:players].each do |player|
            if player[:steals] > number_of_steals
                number_of_steals = player[:steals]
                high_stealer = player[:player_name]
            end
        end
    end
    if longest_name == high_stealer
        return true
    end
end





