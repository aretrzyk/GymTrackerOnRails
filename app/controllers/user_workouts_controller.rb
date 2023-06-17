class UserWorkoutsController < ApplicationController
  before_action :set_user_workout, only: %i[ show edit update destroy ]

  # GET /user_workouts or /user_workouts.json
  def index
    @user_workouts = UserWorkout.all
  end

  # GET /user_workouts/1 or /user_workouts/1.json
  def show
  end

  # GET /user_workouts/new
  def new
    @user_workout = UserWorkout.new
  end

  # GET /user_workouts/1/edit
  def edit
  end

  # POST /user_workouts or /user_workouts.json
  def create
    @user_workout = UserWorkout.new(user_workout_params)

    respond_to do |format|
      if @user_workout.save
        format.html { redirect_to user_workout_url(@user_workout), notice: "User workout was successfully created." }
        format.json { render :show, status: :created, location: @user_workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_workouts/1 or /user_workouts/1.json
  def update
    respond_to do |format|
      if @user_workout.update(user_workout_params)
        format.html { redirect_to user_workout_url(@user_workout), notice: "User workout was successfully updated." }
        format.json { render :show, status: :ok, location: @user_workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_workouts/1 or /user_workouts/1.json
  def destroy
    @user_workout.destroy

    respond_to do |format|
      format.html { redirect_to user_workouts_url, notice: "User workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_workout
      @user_workout = UserWorkout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_workout_params
      params.require(:user_workout).permit(:user_id, :workout_id)
    end
end
