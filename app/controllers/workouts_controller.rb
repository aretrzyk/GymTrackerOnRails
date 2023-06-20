class WorkoutsController < ApplicationController
  before_action :require_login

  # GET /workouts or /workouts.json
  def index
    @workouts = Workout.where(user_id: current_user.id)
  end

  # GET /workouts/1 or /workouts/1.json
  def show
    @workout = Workout.find(params[:id])
    @exercise_sets = ExerciseSet.where(workout_id: @workout.id)
  end

  # GET /workouts/new
  def new
    @user = User.find(current_user.id)
    @workout = Workout.new(workout_params)
    @workout.save
    redirect_to workouts_path
  end

  # GET /workouts/1/edit
  def edit
  end

  def create
    @workout = Workout.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to workouts_url, notice: "Workout was successfully created." }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /workouts/1 or /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to workout_url(@workout), notice: "Workout was successfully updated." }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url, notice: "Workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_workout
    @workout = Workout.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def workout_params
    params.require(:workout).permit(:user_id)
  end

end
