# == Schema Information
#
# Table name: mortalities
#
#  id           :integer          not null, primary key
#  count        :integer
#  house_id     :integer
#  registrar_id :integer
#  cause        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Mortality < ApplicationRecord
  validates_presence_of :count, :cause
  validates :cause, length: { minimum: 50 }

  belongs_to :house
  belongs_to :registrar, class_name: 'User'
end
