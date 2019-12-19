class CandidaciesController < ApplicationController
  before_action :set_candidacy, only: [:show, :edit, :update, :destroy]

  # GET /candidacies
  # GET /candidacies.json
  def index
    @candidacies = Candidacy.where(notice_id = Notice.last.id.to_s)
    @notice = Notice.last
  end

  # GET /results
  def results
    if (!Notice.last.resultados_liberados)
      respond_to do |format|
        format.html { redirect_to candidacies_path, notice: 'Resultados ainda não foram liberados!' and return}
      end
    end
    @subjects = Subject.all
    @candidacies = Candidacy.where(notice_id = Notice.last.id.to_s)
  end

  # GET /candidacies/1
  # GET /candidacies/1.json
  def show
  end

  # GET /candidacies/new
  def new
    unless (current_user)
      respond_to do |format|
        format.html { redirect_to new_user_session_path, notice: 'Você precisa estar logado para candidatar-se!' and return}
      end
    end

    if (current_user.qtdCandidaturasUltimoEdital() >= 2)
      respond_to do |format|
        format.html { redirect_to candidacies_path, notice: 'Você já tem duas candidaturas nesse edital!' and return}
      end
    end

    if (Notice.last.encerrado)
      respond_to do |format|
        format.html { redirect_to candidacies_path, notice: 'Candidaturas encerradas! Aguarde para conferir o resultado final.' and return}
      end
    end
    
    @candidacy = Candidacy.new
    @subjects = Subject.all
  end

  # GET /candidacies/1/edit
  def edit
    @subjects = Subject.all
  end

  # Close Notice 
  def closeNotice
    if (current_user)
      if (current_user.isAdmin)
        notice = Notice.last
        notice.encerrado = true
        notice.save
      end
    end
    respond_to do |format|
      format.html { redirect_to candidacies_path, notice: 'Edital encerrado com sucesso!' and return}
    end
  end

  # Show results
  def showResults
    if (current_user)
      if (current_user.isAdmin)
        if (Notice.last.encerrado)
          notice = Notice.last
          notice.resultados_liberados = true
          notice.save
          candidaturas = Candidacy.where(notice: notice, status: 'APROVADO')
          for c in candidaturas do
            c.calcMedia
          end
          for s in Subject.all do
            #vencedor = Candidacy.find_by_sql("SELECT MAX(media) FROM candidacies WHERE notice_id = " + notice.id.to_s + " AND subject_id = " + s.id.to_s)
            
            if (s.candidacies.length != 0)
              vencedor = Candidacy.where(subject: s, notice: notice).order('media desc').first
              if (vencedor)
                vencedor.resultado = 'Classificado'
                vencedor.save
              end
            end
          end
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to results_path, notice: 'Resultados gerados com sucesso!' and return}
    end
  end

  # POST /candidacies
  # POST /candidacies.json
  def create

    if (current_user)
      if (current_user.isAdmin())
        respond_to do |format|
          format.html { redirect_to candidacies_path, notice: 'Não é possível coordenador se candidatar para monitoria!' and return}
        end
      end
    end

    @candidacy = Candidacy.new(candidacy_params)
    @candidacy.data = Time.now() - 3600 * 3
    @candidacy.user = current_user
    @candidacy.notice = Notice.last

    respond_to do |format|
      if @candidacy.save
        format.html { redirect_to @candidacy, notice: 'Candidacy was successfully created.' }
        format.json { render :show, status: :created, location: @candidacy }
      else
        format.html { render :new }
        format.json { render json: @candidacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidacies/1
  # PATCH/PUT /candidacies/1.json
  def update
    respond_to do |format|
      if @candidacy.update(candidacy_params)
        format.html { redirect_to candidacies_path, notice: 'Candidatura aprovada!' }
        format.json { render :show, status: :ok, location: @candidacy }
      else
        format.html { render :edit }
        format.json { render json: @candidacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidacies/1
  # DELETE /candidacies/1.json
  def destroy
    @candidacy.destroy
    respond_to do |format|
      format.html { redirect_to candidacies_url, notice: 'Candidacy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidacy
      @candidacy = Candidacy.find(params[:id])
    end

    def set_subjects
      @subjects = Subject.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidacy_params
      params.require(:candidacy).permit(:cre, :nota, :media, :status, :resultado, :data, :user_id, :notice_id, :subject_id)
    end
    
    # Set Last Notice on notice
    def set_notice
      @notice = Notice.last
    end
end
