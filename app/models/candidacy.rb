class Candidacy < ApplicationRecord
  belongs_to :user
  belongs_to :notice
  belongs_to :subject

  validates :cre, :nota, :subject, presence: true

  def calcMedia
    self.media = ((self.cre * 3) + (self.nota*7))/10
  end

end
