class Article < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :catalog

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :title, presence: true, length: { minimum: 1, maximum: 50 } , uniqueness: true
  validates :body, presence: true, length: { minimum: 3 }

end
