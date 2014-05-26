# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)
#  address1    :string(255)
#  address2    :string(255)
#  city        :string(255)
#  state       :string(255)
#  zip         :integer
#  sport_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Location < ActiveRecord::Base  
  validates :name, presence: true, uniqueness: true
  has_many :games, class_name: "Game", foreign_key: :location_id
  belongs_to :sport, class_name: "Sport", foreign_key: :sport_id
  
  def gmaps_url
    return "http://maps.google.com/maps?q=#{self.address1} #{address2}," +
    " #{self.city}, #{self.state}"
  end
  
end
