class ExercisesController < ApplicationController
  before_action :require_login

  # GET /exercises or /exercises.json
  def index
    @exercises = Exercise.where(user_id: current_user.id)
  end

  # GET /exercises/1 or /exercises/1.json
  def show
    @exercise = Exercise.find(params[:id])
    @exercise_sets = ExerciseSet.where(exercise_id: @exercise.id)
    workouts_id = @exercise_sets.map(&:workout_id)
    workout_id_min = workouts_id.min
    workout_id_max = workouts_id.max
    @reps = []
    @weight = []
    @avg_volume = []
    @total_volume = []
    unless workout_id_min.nil? || workout_id_max.nil?
      (workout_id_min..workout_id_max).each { |i|
        @workout = Workout.find(i)
        @workout_sets = @exercise_sets.where(workout_id: i)
        @reps.append([@workout.created_at, (@workout_sets.average(:reps)).round(1)])
        @weight.append([@workout.created_at, (@workout_sets.average(:weight)).round(1)])
        @avg_volume.append([@workout.created_at, (@workout_sets.map { |x| x.reps * x.weight }.sum / @workout_sets.count).round])
        @total_volume.append([@workout.created_at, @workout_sets.map { |x| x.reps * x.weight }.sum])
      }
    end
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises or /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to exercises_url, notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :user_id)
    end
end
