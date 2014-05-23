# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  league_id      :integer
#  date_time      :datetime         not null
#  team1_id       :integer          not null
#  team2_id       :integer          not null
#  team1_score    :integer
#  team2_score    :integer
#  location_id    :integer
#  location_other :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Game < ActiveRecord::Base
  validates :date_time, :team1_id, :team2_id, presence: true
  
  belongs_to :league, foreign_key: :league_id, class_name: "League"
  belongs_to :home_team, foreign_key: :team1_id, class_name: "Team"
  belongs_to :away_team, foreign_key: :team2_id, class_name: "Team"
  
  
  def teams
    return [self.home_team, self.away_team]
  end
  
end
