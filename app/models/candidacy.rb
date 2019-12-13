class Candidacy < ApplicationRecord
  belongs_to :user
  belongs_to :notice
  belongs_to :subject
end
