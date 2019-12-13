class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :candidacies
end
