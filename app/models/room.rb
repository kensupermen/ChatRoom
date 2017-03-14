class Room < ApplicationRecord
  has_many :messages

  accepts_nested_attributes_for :messages
end
