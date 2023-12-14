class Api::V1::ExercisesController < ApplicationController
  before_action :find_exercise, only: [:destroy]

  def user_yoga
    exercises = current_user.exercises.includes(:yoga)
    render json: exercises, include: 'yoga'
  end

  def create
    puts "Params-------------------: #{params.inspect}"
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      render json: { message: 'Exercise created successfully', exercise: @exercise }, status: :created
    else
      render json: { errors: @exercise.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @exercise.destroy
      render json: { message: 'Exercise deleted successfully' }
    else
      render json: { errors: @exercise.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:yoga_id)
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end
end
