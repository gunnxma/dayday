class FeelingsController < ApplicationController
  before_filter :find_thing, :only => [:index, :create]
  def index
    @feelings = @thing.feelings.order(id: :desc).page(params[:page]).per(15)
    @feeling = Feeling.new
    @title = @thing.page_title_feelings
  end

  def create
    @feeling = Feeling.new(feeling_params)
    @feeling.up = 0
    @feeling.user_id = current_user.id
    @thing.feelings << @feeling

    @thing.save
  end

private

  def find_thing
      @thing = Thing.find(params[:thing_id])
  end

	def feeling_params
    params.require(:feeling).permit(:body)
  end
end