class Notice < ApplicationRecord
    has_many :candidacies

    validates :semestre, presence: true
end
