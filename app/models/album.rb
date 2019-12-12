class Album < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :date, presence: true

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :user_albums, ->(user) { where(['user_id = ?', user.id]) }
end
