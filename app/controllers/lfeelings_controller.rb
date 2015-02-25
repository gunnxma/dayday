class LfeelingsController < ApplicationController
	before_filter :find_list, :only => [:create]

  def create
    @lfeeling = Lfeeling.new(lfeeling_params)
    @lfeeling.user_id = current_user.id
    @list.lfeelings << @lfeeling

    @list.save
  end

private

  def find_list
      @list = List.find(params[:list_id])
  end

	def lfeeling_params
    params.require(:lfeeling).permit(:body)
  end
end
