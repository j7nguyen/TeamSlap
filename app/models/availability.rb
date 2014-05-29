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
      return "<button class='avail-btn btn btn-info btn-sm'>".html_safe +
      "No Response</button>".html_safe
    when 1
      return "<button class='avail-btn btn btn-success btn-sm'>".html_safe +
      "Available</button>".html_safe
    when 2
      return "<button class='avail-btn btn btn-danger btn-sm'>".html_safe +
      "Unavailable</button>".html_safe
    when 3
      return "<button class='avail-btn btn btn-warning btn-sm'>".html_safe +
      "Maybe</button>".html_safe
    end
  end
 
  
end
