class OwnsController < ApplicationController
  authorize_resource :class => false
  
	before_filter :find_ownable

	def create
    current_user.own(@item)
    render text: @item.owns.count
  end

  def destroy
  	current_user.unown(@item)
    render text: @item.owns.count
  end

private

	def find_ownable
	  @item = Thing.find_by_id(params[:id])
  end
end
