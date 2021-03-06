class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article, touch: true
  belongs_to :commentable, polymorphic: true, touch: true
  has_many :comments, as: :commentable

  validates :description, presence: true, length: { minimum: 1 }

  def to_hash
    {id: self.id, description: self.description}
  end
end
