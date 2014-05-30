# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  first_name      :string(255)      not null
#  last_name       :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  gender          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  
  attr_accessor :password

  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 6 }, :allow_nil => true

  before_validation :ensure_session_token
  
  has_many :roster_adds, class_name: "RosterAdd", foreign_key: :player_id
  has_many :teams, through: :roster_adds, source: :team
  has_many :owned_teams, class_name: "Team", foreign_key: :manager_id
  has_many :availabilities, class_name: "Availability", foreign_key: :player_id
  has_many :owned_leagues, class_name: "League", foreign_key: :league_manager_id
  has_many :leagues, through: :teams, source: :leagues
  
  def is_available?(game_id)
    avail = Availability.where(player_id: self.id, game_id: game_id).first
    return (avail.available_value == 1)
  end
  
  def availability(game)
    avail = (Availability.find_by player_id: self.id, game_id: game.id) ||
    Availability.create({player_id: self.id, game_id: game.id, available_value: 0 })
  end
  
  def games
    games = []
    
    self.teams.each do |team|
      games.concat(team.games)
    end
    
    return games.uniq.sort_by{|game| game.date}
  end
  
  def name
    return "#{self.first_name} #{self.last_name}"
  end
  
  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)
    @user.try(:is_password?, password) ? @user : nil
  end

  def password=(given_password)
    @password = given_password
    self.password_digest = BCrypt::Password.create(given_password)
  end

  def is_password?(given_password)
    BCrypt::Password.new(self.password_digest).is_password?(given_password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end
  


  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
  
end
