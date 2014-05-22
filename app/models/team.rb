# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  sport      :string(255)      not null
#  manager_id :integer          not null
#  league_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  has_many :roster_adds, class_name: "RosterAdd", foreign_key: :team_id
  has_many :players, through: :roster_adds, source: :user

end