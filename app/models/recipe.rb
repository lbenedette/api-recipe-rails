class Recipe < ApplicationRecord
  enum category: {entree: 0, desert: 1, apettizer: 2, snack: 3}

  validates :title, presence: true
  validates :category, presence: true
  validates :preparation_time, presence: true
  validates :oven_time, presence: true
  validates :ingredients, presence: true
  validates :steps, presence: true

  belongs_to :user
end
