class Year < ActiveRecord::Base
  has_many :home_links, -> { order(position: :asc) }
  has_many :registrations
end
