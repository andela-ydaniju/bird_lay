class Mortality < ApplicationRecord
  validates_presence_of :count, :cause
  validates :cause, length: { minimum: 50 }

  belongs_to :house
end
