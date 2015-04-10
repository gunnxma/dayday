require 'rails_helper'

RSpec.describe IndexController, type: :controller do
	render_views
	let(:user) { FactoryGirl.create(:user) }

	describe "GET #index" do
		it "user not signed in" do
			get :index
			expect(response).to be_success
			expect(response.body).to match(/注册/)
		end

		it "user signed in" do
			allow(controller).to receive(:current_user).and_return(user)

			get :index
			expect(response).to be_success
			expect(response.body).to match(/个人主页/)
		end
	end
end
