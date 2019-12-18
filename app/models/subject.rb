class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :candidacies

  validates :nome, :sigla, :periodo, :teacher, presence: true
end
