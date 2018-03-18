class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :article

  validates :description, presence: true, length: { minimum: 3 }

  def to_hash
    {id: self.id, name: self.name, description: self.description}
  end
end
