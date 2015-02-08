class ReviewsController < ApplicationController
	before_filter :find_thing, :only => [:index, :new, :create, :edit, :update, :destroy]
	before_filter :find_review, :only => [:edit, :update, :show, :destroy]
	
	def index
	end

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		if @review.title.empty? || @review.body.empty?
			flash[:notice] = '请将必填项填写完整'
			render 'new'
			return
		end
		@review.publish = false		
		@review.user_id = current_user.id
		@review.up = 0
		@thing.reviews << @review
		
		if @thing.save
			if params[:commit] == '保存'
				flash[:notice] = '评测保存成功'
				redirect_to edit_thing_review_path(@thing, @review)
			else
				@thing.publish = true
				@thing.save
				redirect_to thing_reviews_path(@thing)
			end
		else
			flash[:notice] = '评测保存失败'
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update_attributes(review_params)
			if params[:commit] == '保存'
				flash[:notice] = '评测修改成功'
				redirect_to edit_thing_review_path(@thing, @review)
			else
				if !@review.publish
					@review.publish = true
					@review.save
				end
				redirect_to thing_reviews_path(@thing)
			end
		else
			flash[:notice] = '评测修改失败'
			render 'edit'
		end
	end

	def show
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
