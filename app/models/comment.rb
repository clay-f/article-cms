class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :article

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 3 }

  def to_hash
    {name: self.name, description: self.description}
  end
end
