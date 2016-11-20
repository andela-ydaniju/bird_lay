class House < ApplicationRecord
  belongs_to :admin

  validates :name, :code, :capacity, :stage, presence: true
end
