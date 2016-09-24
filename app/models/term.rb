class Term < ApplicationRecord
  has_many :lists, through: :studying
  has_many :studying, dependent: :delete_all
end
