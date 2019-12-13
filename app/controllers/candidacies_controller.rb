class CandidaciesController < ApplicationController
  before_action :set_candidacy, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit]
  before_action :set_notices, only: [:new, :edit]
  before_action :set_subjects, only: [:new, :edit]

  # GET /candidacies
  # GET /candidacies.json
  def index
    @candidacies = Candidacy.all
  end

  # GET /candidacies/1
  # GET /candidacies/1.json
  def show
  end

  # GET /candidacies/new
  def new
    @users = User.all
    @notices = Notice.all
    @subjects = Subject.all
    @candidacy = Candidacy.new
  end

  # GET /candidacies/1/edit
  def edit
    @users = User.all
    @notices = Notice.all
    @subjects = Subject.all
  end

  # POST /candidacies
  # POST /candidacies.json
  def create
    @candidacy = Candidacy.new(candidacy_params)
    # Time.now está retornando um horario 3h a frente, por isso a subtração de 3h abaixo
    @candidacy.data = Time.now - 3600 * 3

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
        format.html { redirect_to @candidacy, notice: 'Candidacy was successfully updated.' }
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

    def set_users
      @users = User.all
    end

    def set_notices
      @notices = Notice.all
    end

    def set_subjects
      @subjects = Subject.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidacy_params
      params.require(:candidacy).permit(:cre, :nota, :status, :resultado, :data, :user_id, :notice_id, :subject_id)
    end
end
