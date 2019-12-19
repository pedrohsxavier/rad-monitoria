class Candidacy < ApplicationRecord
  belongs_to :user
  belongs_to :notice
  belongs_to :subject

  validates :cre, :nota, :subject, presence: true

  # TODO: Move to controller
  def calcMedia
    self.media = ((self.cre * 3) + (self.nota * 7)) / 10
    self.save
  end

end
