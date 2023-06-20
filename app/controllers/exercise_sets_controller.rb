class ExerciseSetsController < ApplicationController
  before_action :set_exercise_set, only: %i[ show edit update destroy ]

  # GET /exercise_sets or /exercise_sets.json
  def index
    @exercise_sets = ExerciseSet.all
  end

  # GET /exercise_sets/1 or /exercise_sets/1.json
  def show
  end

  # GET /exercise_sets/new
  def new
    @exercise_set = ExerciseSet.new
  end

  # GET /exercise_sets/1/edit
  def edit
  end

  # POST /exercise_sets or /exercise_sets.json
  def create
    @workout = Workout.find(params[:workout_id])
    @exercise_set = @workout.exercise_set.build(exercise_set_params)

    if @exercise_set.save
      redirect_to @workout, notice: 'Exercise Set was successfully created.'
    else
      render :new
    end
  end

  # DELETE /exercise_sets/1 or /exercise_sets/1.json
  def destroy
    @workout = Workout.find(params[:workout_id])
    @exercise_set.destroy
    redirect_to @workout, notice: 'Exercise Set was successfully deleted.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_exercise_set
    @exercise_set = ExerciseSet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exercise_set_params
    params.require(:exercise_set).permit(:exercise_id, :workout_id, :sets, :reps, :weight)
  end
end
