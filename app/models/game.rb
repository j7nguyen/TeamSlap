# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  league_id      :integer
#  team1_id       :integer          not null
#  team2_id       :integer          not null
#  team1_score    :integer
#  team2_score    :integer
#  location_id    :integer
#  location_other :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  date           :string(255)      not null
#  time           :string(255)      not null
#  team2_name     :string(255)
#

class Game < ActiveRecord::Base
  
  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September',
    'October', 'November', 'December']
  
  validates :date, :time, :team1_id, :team2_id, presence: true
  
  belongs_to :league, foreign_key: :league_id, class_name: "League"
  belongs_to :home_team, foreign_key: :team1_id, class_name: "Team"
  belongs_to :away_team, foreign_key: :team2_id, class_name: "Team"
  belongs_to :location, foreign_key: :location_id, class_name: "Location"
  has_many :availabilities
  
  def month
    mo = Date.parse(self.date).month
    return MONTHS[mo.to_i-1]
  end
  
  def date_disp
    return "#{self.month} #{Date.parse(self.date).day}, #{Date.parse(self.date).year}"
  end
  
  def time_disp
    hour, minute = self.time.split(':')
    if hour.to_i > 12
      hour = hour.to_i - 12
      return "#{hour}:#{minute} p.m."
    elsif hour.to_i == 12
      return "#{hour}:#{minute} p.m."
    else
      return "#{hour}:#{minute} a.m."
    end
  end
  
  def teams
    return [self.home_team, self.away_team]
  end

  def result
    if self.team1_score.nil? || self.team2_score.nil?
      return "TBD"
    else
      return "#{self.team1_score || ''} - #{self.team2_score || ''}"
    end
  end
  
end
