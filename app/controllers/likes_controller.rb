class LikesController < ApplicationController
	before_filter :find_likeable

	def create
    current_user.like(@item)
    render text: @item.likes.count
  end

  def destroy
  	current_user.unlike(@item)
    render text: @item.likes.count
  end

private

	def find_likeable
    if !params[:type].in?(%W(Thing List))
      render text: '-1'
      return false
    end

    case params[:type].downcase
    when 'thing'
      klass = Thing
    when 'list'
      klass = List
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
