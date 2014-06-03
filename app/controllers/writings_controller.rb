class WritingsController < ApplicationController
  before_action :set_writing, only: [:show, :edit, :update, :destroy]

  # GET /writings
  # GET /writings.json
  def index
    @writings = Writing.all
  end

  # GET /writings/1
  # GET /writings/1.json
  def show
  end

  # GET /writings/new
  def new
    @writing = Writing.new
  end

  # GET /writings/1/edit
  def edit
  end

  # POST /writings
  # POST /writings.json
  def create
    @patient = Patient.find(params[:patient_id])
    @writing = @patient.writings.create(writing_params)
    #redirect_to patient_path(@patient)

    respond_to do |format|
      if @writing.save
        format.html { redirect_to @patient, notice: 'Запись успешно добавлена.' }
        format.json { render action: 'show', status: :created, location: @writing }
      else
        format.html { render action: 'new' }
        format.json { render json: @writing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /writings/1
  # PATCH/PUT /writings/1.json
  def update
    respond_to do |format|
      if @writing.update(writing_params)
        format.html { redirect_to @writing, notice: 'Writing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @writing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writings/1
  # DELETE /writings/1.json
  def destroy
    @patient = Patient.find(params[:patient_id])
    @writing = @patient.writings.find(params[:id])
    @writing.destroy
    
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_writing
      @writing = Writing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def writing_params
      params.require(:writing).permit(:diagnosis, :treatment, :patient_id)
    end
end
