# == Schema Information
#
# Table name: lineup_positions
#
#  id         :integer          not null, primary key
#  lineup_id  :integer          not null
#  name       :string(255)
#  player_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class LineupPosition < ActiveRecord::Base
  
  validates :lineup_id, presence: true
  
  belongs_to :player, foreign_key: :player_id, class_name: "User"
  belongs_to :lineup
  
  def player_info
    return "#{player.name}, #{player.gender}"
  end
  
end
