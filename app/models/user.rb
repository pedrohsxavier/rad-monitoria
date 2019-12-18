class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :candidacies

  validates :nome, :matricula, presence: true

  def qtdCandidaturasUltimoEdital
    @id_ultimo_edital = Notice.last.id
    return Candidacy.where(
      "notice_id = " + @id_ultimo_edital.to_s + " AND user_id = " + self.id.to_s
    ).count
  end

  def isAdmin
    return self.admin
  end

end
