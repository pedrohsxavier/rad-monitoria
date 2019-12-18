class Teacher < ApplicationRecord
    has_many :subjects
    validates :nome, :email, presence: true
end
