class ReviewsController < ApplicationController
	before_filter :find_thing, :only => [:index, :new, :create, :edit, :update, :show, :destroy]
	before_filter :find_review, :only => [:edit, :update, :show, :destroy]
	
	def index
		@reviews = @thing.reviews.order(id: :desc).page(params[:page]).per(15)
    @title = @thing.page_title_reviews
	end

	def new
		@review = Review.new
	end

	def create
		@review = current_user.reviews.new_by_publish(review_params, params[:commit] == '保存' ? false : true)		
		@thing.reviews << @review
		
		if @thing.save
			if !@review.publish
				flash[:notice] = '评测保存成功'
				redirect_to edit_thing_review_path(@thing, @review)
			else
				redirect_to thing_review_path(@thing, @review)
			end
		else
			flash[:notice] = '评测保存失败'
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update_attributes_with_publish(review_params, params[:commit] == '保存' ? false : true)
			if !@review.publish
				flash[:notice] = '评测修改成功'
				redirect_to edit_thing_review_path(@thing, @review)
			else
				redirect_to thing_review_path(@thing, @review)
			end
		else
			flash[:notice] = '评测修改失败'
			render 'edit'
		end
	end

	def show
		@rfeeling = Rfeeling.new
		@rfeelings = @review.rfeelings.order(id: :desc).page(params[:page]).per(15)
    @title = @review.page_title
	end

	def destroy
		@review.destroy
		redirect_to thing_reviews_path(@thing)
	end

	private

	def find_thing
		@thing = Thing.find(params[:thing_id])
	end

	def find_review
		@review = Review.find(params[:id])
	end

	def review_params
    params.require(:review).permit(:title, :body)
  end
end
