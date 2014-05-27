# == Schema Information
#
# Table name: lineups
#
#  id         :integer          not null, primary key
#  team_id    :integer          not null
#  game_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Lineup < ActiveRecord::Base
  validates :team_id, :game_id, presence: true
  
  belongs_to :team
  belongs_to :game
  has_many :positions, foreign_key: :lineup_id, class_name: "LineupPosition"
  
  def available_players
    self.team.players.select do |player|
      player.is_available?(self.game_id)
    end
  end
  
end
