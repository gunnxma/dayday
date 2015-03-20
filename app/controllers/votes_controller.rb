class VotesController < ApplicationController
  authorize_resource :class => false
  
	before_filter :find_voteable

	def create
    current_user.vote(@item)
    render text: @item.votes.count
  end

  def destroy
  	current_user.unvote(@item)
    render text: @item.votes.count
  end

private

	def find_voteable
    if !params[:type].in?(%W(Feeling Review))
      render text: '-1'
      return false
    end

    case params[:type].downcase
    when 'feeling'
      klass = Feeling
    when 'review'
      klass = Review
    else
      return false
    end

    @item = klass.find_by_id(params[:id])
    if @item.blank?
      render text: '-2'
      return false
    end
  end
end
