class Year < ActiveRecord::Base
  has_many :home_links, -> { order(position: :asc) }
  has_many :registrations
  has_many :sponsors, -> { order(position: :asc) }
  has_many :publishers, -> { order(position: :asc) }
end
