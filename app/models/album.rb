class Album < ApplicationRecord
  # Add associations
  belongs_to :user
  has_many :pictures, dependent: :destroy

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  # Add validations
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :date, presence: true

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Add scope
  scope :user_albums, ->(user) { where(['user_id = ?', user.id]) }
end
