class Candidacy < ApplicationRecord
  belongs_to :user
  belongs_to :notice
  belongs_to :subject

  validates :cre, :nota, :subject, presence: true
end
