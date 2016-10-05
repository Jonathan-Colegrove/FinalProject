class List < ApplicationRecord
  belongs_to :user
  has_many :terms, through: :studyings
  has_many :studyings, dependent: :delete_all
end
