# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  manager_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  sport_id   :integer          not null
#

class Team < ActiveRecord::Base
  has_many :roster_adds, class_name: "RosterAdd", foreign_key: :team_id
  has_many :players, through: :roster_adds, source: :user
  has_many :team_adds, class_name: "TeamAdd", foreign_key: :team_id
  belongs_to :sport, class_name: "Sport", foreign_key: :sport_id
  has_many :leagues, through: :team_adds, source: :league
  belongs_to :manager, foreign_key: :manager_id, class_name: "User"
  has_many :home_games, foreign_key: :team1_id, class_name: "Game"
  has_many :away_games, foreign_key: :team2_id, class_name: "Game"
  has_many :lineups
  has_many :lineup_positions, through: :lineups, source: :lineup_positions

  def nonleague
    non_league = League.where(sport_id: self.sport_id, name: "Non-League", league_manager_id: self.manager_id).first
    if non_league.nil?
      non_league = League.create({
        sport_id: self.sport_id,
        league_manager_id: self.manager_id,
        name: "Non-League"
      })
    end
      TeamAdd.create({
        league_id: non_league.id,
        team_id: self.id
      })
    return non_league
  end
  
  # def new_nonleague_game(options)
 #    new_team = Team.create({
 #      name: options[:name],
 #      manager_id: 0,
 #      sport_id: self.sport_id
 #    })
 #    new_game = Game.create({
 #      team1_id: self.id,
 #      team2_id: new_team.id,
 #      date: options[:date],
 #      time: options[:time]
 #    })
 #  end

  def lineup(game)
    return Lineup.where(game_id: game.id, team_id: self.id)
  end
  
  def opponent(game)
    if self.id == game.team1_id
      return game.away_team
    else
      return game.home_team
    end
  end
  
  def games
    return (self.home_games + self.away_games).sort_by{|game| game.date}.uniq
  end
end
