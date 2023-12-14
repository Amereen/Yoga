class Api::V1::YogasController < ApplicationController
  before_action :find_youga, only: %i[show update destroy]

  def index
    @yogas = Yoga.all
    yogas_with_image_urls = @yogas.map { |yoga| yoga.attributes.merge(image_url: yoga.image_url) }
    render json: yogas_with_image_urls
  end

  def show
    @comments = @youga.comments.includes(:user)
    comment_data = @comments.map do |comment|
      {
        id: comment.id,
        content: comment.content,
        created_at: comment.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
        user_email: comment.user.email,
        comment_user_id: comment.user.id,
        current_user: current_user.id
      }
    end
    render json: {
      youga: @youga,
      comments: comment_data
    }
  end

  def create
    @youga = Yoga.new(youga_params)
    if @youga.save
      render json: { message: 'Yoga successfully created', youga: @youga }, status: :created
    else
      render json: { errors: @youga.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @youga.update(youga_params)
      render json: { message: 'Yoga successfully updated', youga: @youga }
    else
      render json: { errors: @youga.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @youga.destroy
    render json: { message: 'Yoga successfully deleted' }
  end

  private

  def youga_params
    params.require(:youga).permit(:name, :description, :duration, :user_id, :picture, :video_url)
  end

  def find_youga
    @youga = Yoga.find(params[:id])
  end
end
