class Meal < ApplicationRecord
  belongs_to :diet
  has_many :meal_foods
  validates_presence_of :time_at
  validates_presence_of :diet_id
  validates_presence_of :name
end
