class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :article

  validates :description, presence: true, length: { minimum: 1 }

  def to_hash
    {id: self.id, name: self.name, description: self.description}
  end
end
