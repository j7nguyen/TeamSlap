# == Schema Information
#
# Table name: leagues
#
#  id                :integer          not null, primary key
#  sport_id          :integer          not null
#  league_manager_id :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  name              :string(255)      not null
#

class League < ActiveRecord::Base
  validates :sport_id, :league_manager_id, presence: true
  
  has_many :team_adds, foreign_key: :league_id, class_name: "TeamAdd"
  has_many :teams, through: :team_adds, source: :team
  belongs_to :sport, foreign_key: :sport_id, class_name: "Sport"
  belongs_to :manager, foreign_key: :league_manager_id, class_name: "User"
end
