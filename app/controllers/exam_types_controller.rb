class ExamTypesController < ApplicationController
  before_action :set_exam_type, only: %i[ show edit update destroy ]

  # GET /exam_types or /exam_types.json
  def index
    @exam_types = ExamType.ordered
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

    if @exam_type.save
      flash.now[:notice] = "Exam Type was successfully created."

      render turbo_stream: [
        turbo_stream.prepend("exam_types", @exam_type),
        turbo_stream.update(ExamType.new, ""),
        turbo_stream.prepend("flash", partial: "layouts/flash")
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exam_types/1 or /exam_types/1.json
  def update
    if @exam_type.update(exam_type_params)
      flash.now[:notice] = "Exam Type was successfully updated."

      render turbo_stream: [
        turbo_stream.replace(@exam_type, @exam_type),
        turbo_stream.prepend("flash", partial: "layouts/flash")
      ]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /exam_types/1 or /exam_types/1.json
  def destroy
    @exam_type.destroy
    flash.now[:notice] = "Exam Type was successfully destroyed."

    render turbo_stream: [
      turbo_stream.remove(@exam_type),
      turbo_stream.prepend("flash", partial: "layouts/flash")
    ]
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
