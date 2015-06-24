class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs
  include Slugifiable::InstanceMethods
end