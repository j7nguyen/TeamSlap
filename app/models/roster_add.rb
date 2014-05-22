# == Schema Information
#
# Table name: roster_adds
#
#  id         :integer          not null, primary key
#  team_id    :integer          not null
#  player_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class RosterAdd < ActiveRecord::Base
  belongs_to :user, foreign_key: :player_id, class_name: "User"
  belongs_to :team, foreign_key: :team_id, class_name: "Team"
end
