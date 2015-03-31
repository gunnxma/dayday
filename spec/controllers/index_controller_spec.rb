require 'rails_helper'

RSpec.describe IndexController, type: :controller do
	render_views	

	describe "GET #index" do
		it "responds successfully" do
			get :index
			expect(response).to be_success
			expect(response.body).to match(/注册/)
		end
	end
end
