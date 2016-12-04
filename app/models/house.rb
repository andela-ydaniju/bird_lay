class House < ApplicationRecord
  belongs_to :user, -> { where(level: 2) }
end
