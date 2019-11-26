class Album < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :date, presence: true
end
