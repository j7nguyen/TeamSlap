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
  has_many :locations, through: :sport, source: :locations
  has_many :games, foreign_key: :league_id, class_name: "Game"

  def other_id
    if self.teams.map{|team| team.name}.include?("Other")
      return self.teams.where(name: "Other").first.id
    else
      new_team = Team.create({
        name: "Other",
        manager_id: 0,
        sport_id: self.sport_id
      })
      TeamAdd.create({team_id: new_team.id, league_id: self.id})
      return new_team.id
    end
  end
  
end
