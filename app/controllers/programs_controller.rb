class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy, :create]

  def index
    @programs = Program.all_programs(current_user.id)
  end

  def show
    @program = Program.single_program(current_user.id, params[:id])
    @workouts = @program.workouts
  end

  def new
    @program = current_user.programs.new
  end

  def create
    Program.create_program(program_params, current_user.id)
    redirect_to programs_path
  end

  def edit
  end

  def update
    Program.update_program(@program.id, program_params)
    redirect_to programs_path
  end

  def destroy
    @program.destroy
    redirect_to programs_path
  end


  private
    def set_program
      @program = Program.single_program(current_user.id, params[:id])
    end

    def program_params
      params.require(:program).permit(:name, :week_duration, :days_per_week)
    end
end
