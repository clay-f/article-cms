class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :article

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 3 }
end
