class IndexController < ApplicationController
	def index
		@things = Thing.where('publish = ?', true).order(id: :desc).page(params[:page]).per(15)

		respond_to do |format|
      format.json
      format.html          # /app/views/home/index.html.erb
      format.html.phone    # /app/views/home/index.html+phone.erb
      format.html.tablet   # /app/views/home/index.html+tablet.erb
    end
	end

	def hits
		@things = Thing.where('publish = ?', true).order(hits: :desc).page(params[:page]).per(15)
		render 'index'
	end

	def reviews
		@reviews = Review.where('publish = ?', true).order(hits: :desc).page(params[:page]).per(20)
	end

	def error_404
    render_404
  end

  #def phones
  #	render layout: false
  #end
end
