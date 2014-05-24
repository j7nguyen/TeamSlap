# == Schema Information
#
# Table name: availabilities
#
#  id              :integer          not null, primary key
#  player_id       :integer          not null
#  game_id         :integer          not null
#  available_value :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Availability < ActiveRecord::Base
  
  before_validation :ensure_valid_availability
  
  validates :player_id, :game_id, :available_value, presence: true
  
  belongs_to :player, foreign_key: :player_id, class_name: "User"
  belongs_to :game
  
  def ensure_valid_availability
    self.available_value >= 0 && self.available_value <=2
  end
end
