# == Schema Information
#
# Table name: availabilities
#
#  id              :integer          not null, primary key
#  player_id       :integer          not null
#  game_id         :integer          not null
#  available_value :integer          default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Availability < ActiveRecord::Base
  
  before_validation :ensure_valid_availability
  
  validates :player_id, :game_id, :available_value, presence: true
  
  belongs_to :player, foreign_key: :player_id, class_name: "User"
  belongs_to :game
  
  def ensure_valid_availability
    self.available_value >= 0 && self.available_value <=3
  end
  
  ##For seeding purposes only.
  def self.generate_random_avails
    Game.all.each do |game|
      game.teams.each do |team|
        team.players.each do |player|
          avail = player.availability(game)
          avail.available_value = [1,1,1,1,1,1,2,2,3].sample if avail.available_value == 0
          avail.save
        end
      end
    end
  end
  
  def avail_string
    case self.available_value
    when 0
      return "No Response"
    when 1
      return "Available"
    when 2
      return "Unavailable"
    when 3
      return "Maybe"
    end
  end
  
  def avail_button
    case self.available_value
    when 0
      return "<div class='avail-button no-response'>".html_safe +
      "No Response</div>".html_safe
    when 1
      return "<div class='avail-button available'>".html_safe +
      "Available</div>".html_safe
    when 2
      return "<div class='avail-button unavailable'>".html_safe +
      "Unavailable</div>".html_safe
    when 3
      return "<div class='avail-button maybe'>".html_safe +
      "Maybe</div>".html_safe
    end
  end
 
  
end
