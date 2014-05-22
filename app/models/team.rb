# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  manager_id :integer          not null
#  league_id  :integer
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
end
