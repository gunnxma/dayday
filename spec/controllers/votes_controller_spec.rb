require 'rails_helper'

RSpec.describe VotesController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:user2) { FactoryGirl.create(:user) }
	let(:thing) { FactoryGirl.create(:thing_with_photos, user_id: user.id) }
	let(:feeling) { FactoryGirl.create(:feeling, user_id: user.id, feelingable_id: thing.id, feelingable_type: thing.class.to_s) }
	let(:review) { FactoryGirl.create(:review, user_id: user.id, thing_id: thing.id) }

	before(:each) do
		allow(controller).to receive(:current_user).and_return(user)
	end

	it 'POST /votes type: Feeling' do
		post :create, :type => 'Feeling', :id => feeling.id
		expect(response.body).to eq("1")
		expect(feeling.votes.count).to eq(1)

		post :create, :type => 'Feeling', :id => feeling.id
		expect(response.body).to eq("1")
		expect(feeling.votes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)

		post :create, :type => 'Feeling', :id => feeling.id
		expect(response.body).to eq("2")
		expect(feeling.votes.count).to eq(2)

		allow(controller).to receive(:current_user).and_return(user)

		delete :destroy, :type => 'Feeling', :id => feeling.id
		expect(response.body).to eq("1")
		expect(feeling.votes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)
		delete :destroy, :type => 'Feeling', :id => feeling.id
		expect(response.body).to eq("0")
		expect(feeling.votes.count).to eq(0)		
	end

	it 'POST /votes type: Review' do
		post :create, :type => 'Review', :id => review.id
		expect(response.body).to eq("1")
		expect(review.votes.count).to eq(1)

		post :create, :type => 'Review', :id => review.id
		expect(response.body).to eq("1")
		expect(review.votes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)

		post :create, :type => 'Review', :id => review.id
		expect(response.body).to eq("2")
		expect(review.votes.count).to eq(2)

		allow(controller).to receive(:current_user).and_return(user)

		delete :destroy, :type => 'Review', :id => review.id
		expect(response.body).to eq("1")
		expect(review.votes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)
		delete :destroy, :type => 'Review', :id => review.id
		expect(response.body).to eq("0")
		expect(review.votes.count).to eq(0)
	end

	it 'require login' do
		allow(controller).to receive(:current_user).and_return(nil)

		post :create
		expect(response.status).to eq(403)

		delete :destroy, :type => 'Review', :id => 1
		expect(response.status).to eq(403)
	end

	it 'result -1, -2 when params is wrong' do
		post :create, :type => 'aa', :id => 1
		expect(response.body).to eq('-1')

		delete :destroy, :type => 'aa', :id => 1
		expect(response.body).to eq('-1')

		post :create, :type => 'Feeling', :id => -1
		expect(response.body).to eq('-2')

		delete :destroy, :type => 'Review', :id => -1
		expect(response.body).to eq('-2')
	end
end
