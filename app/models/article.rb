class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  searchkick
  
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :like_articles, dependent: :destroy
  belongs_to :catalog, touch: true
  belongs_to :user
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :catalog_id, :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 100 } , uniqueness: true

  after_save :clear_cache

  private

  def clear_cache
    $redis.del "articles"
  end
end
