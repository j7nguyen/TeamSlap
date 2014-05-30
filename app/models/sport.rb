# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Sport < ActiveRecord::Base
  has_many :teams, foreign_key: :sport_id, class_name: "Team"
  has_many :locations, foreign_key: :sport_id, class_name: "Location"  
end
