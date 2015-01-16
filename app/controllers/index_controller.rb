class IndexController < ApplicationController
	def index
		@things = Thing.order(id: :desc).page(params[:page]).per(5)
	end

	def ajax_page
    @things = Thing.order(id: :desc).page(params[:page]).per(5)
  end

  def endless_page
  	@things = Thing.order(id: :desc).page(params[:page]).per(5)
  end
end
