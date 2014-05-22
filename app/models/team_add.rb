# == Schema Information
#
# Table name: team_adds
#
#  id         :integer          not null, primary key
#  league_id  :integer          not null
#  team_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class TeamAdd < ActiveRecord::Base
  validates :team_id, :league_id, presence: true
  
  belongs_to :team, foreign_key: :team_id, class_name: "Team"
  belongs_to :league, foreign_key: :league_id, class_name: "League"
end
