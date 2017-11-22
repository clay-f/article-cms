class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "original/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  devise :registerable, :lockable

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: {minimum: 1, maximum: 20}, uniqueness: true

  validate :validate_username
  def validate_username
    if User.where(email: name).exists?
      errors.add(:name, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:name].nil?
        where(conditions).first
      else
        where(name: conditions[:name]).first
      end
    end
  end

  def to_hash
    {name: self.name, password: self.password, email: self.email, id: self.id}
  end

end
