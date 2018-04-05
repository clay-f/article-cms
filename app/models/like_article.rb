class LikeArticle < ApplicationRecord
  states_optinos = [0, 1]

  belongs_to :user
  belongs_to :article, touch: true

  validates :state, inclusion: { in: states_optinos }
end
