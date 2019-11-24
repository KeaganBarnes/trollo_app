class WorkoutsController < ApplicationController
    before_action :set_program
    before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = @program.workouts
  end

  def show
  end

  def new
    @workout = @program.workouts.new
  end

  def edit
  end

  def create
    @workout = @program.workouts.new(workout_params)

    if @workout.save
      redirect_to program_workout_path(@program, @workout)
    else
      render :new
    end
  end

  def update
    if @workout.update(workout_params)
      redirect_to [@program, @workout]
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to program_workouts_path(@program)
  end


  private
  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:lift, :sets, :reps, :percentage, :week, :day)
  end

end
