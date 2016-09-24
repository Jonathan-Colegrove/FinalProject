class List < ApplicationRecord
  belongs_to :user
  has_many :terms, through: :studying
  has_many :studying, dependent: :delete_all
end
