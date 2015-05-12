class HomeLink < ActiveRecord::Base
  belongs_to :year
  has_many :tabs
end
