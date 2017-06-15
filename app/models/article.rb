class Article < ApplicationRecord

  searchkick
  has_many :comments, dependent: :destroy
  belongs_to :catalog

  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :title, presence: true, length: { minimum: 3, maximum: 50 } , uniqueness: true
  validates :body, presence: true, length: { minimum: 5 }
end
