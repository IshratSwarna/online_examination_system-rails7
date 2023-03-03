class ExamTypesController < ApplicationController
  before_action :set_exam_type, only: %i[ show edit update destroy ]

  # GET /exam_types or /exam_types.json
  def index
    @exam_types = ExamType.all
  end

  # GET /exam_types/1 or /exam_types/1.json
  def show
  end

  # GET /exam_types/new
  def new
    @exam_type = ExamType.new
  end

  # GET /exam_types/1/edit
  def edit
  end

  # POST /exam_types or /exam_types.json
  def create
    @exam_type = ExamType.new(exam_type_params)

    respond_to do |format|
      if @exam_type.save
        format.html { redirect_to exam_type_url(@exam_type), notice: "Exam type was successfully created." }
        format.json { render :show, status: :created, location: @exam_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_types/1 or /exam_types/1.json
  def update
    respond_to do |format|
      if @exam_type.update(exam_type_params)
        format.html { redirect_to exam_type_url(@exam_type), notice: "Exam type was successfully updated." }
        format.json { render :show, status: :ok, location: @exam_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_types/1 or /exam_types/1.json
  def destroy
    @exam_type.destroy

    respond_to do |format|
      format.html { redirect_to exam_types_url, notice: "Exam type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_type
      @exam_type = ExamType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_type_params
      params.require(:exam_type).permit(:name, :status)
    end
end
