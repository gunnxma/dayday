require 'rails_helper'

RSpec.describe LikesController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:user2) { FactoryGirl.create(:user) }
	let(:thing) { FactoryGirl.create(:thing_with_photos, user_id: user.id) }
	let(:list) { FactoryGirl.create(:list, user_id: user.id) }

	before(:each) do
		allow(controller).to receive(:current_user).and_return(user)
	end

	it 'POST /likes type: Thing' do
		post :create, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.likes.count).to eq(1)

		post :create, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.likes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)

		post :create, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("2")
		expect(thing.likes.count).to eq(2)

		allow(controller).to receive(:current_user).and_return(user)

		delete :destroy, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.likes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)
		delete :destroy, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("0")
		expect(thing.likes.count).to eq(0)		
	end

	it 'POST /likes type: List' do
		post :create, :type => 'List', :id => list.id
		expect(response.body).to eq("1")
		expect(list.likes.count).to eq(1)

		post :create, :type => 'List', :id => list.id
		expect(response.body).to eq("1")
		expect(list.likes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)

		post :create, :type => 'List', :id => list.id
		expect(response.body).to eq("2")
		expect(list.likes.count).to eq(2)

		allow(controller).to receive(:current_user).and_return(user)

		delete :destroy, :type => 'List', :id => list.id
		expect(response.body).to eq("1")
		expect(list.likes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)
		delete :destroy, :type => 'List', :id => list.id
		expect(response.body).to eq("0")
		expect(list.likes.count).to eq(0)
	end

	it 'require login' do
		allow(controller).to receive(:current_user).and_return(nil)

		post :create
		expect(response.status).to eq(403)

		delete :destroy, :type => 'Thing', :id => 1
		expect(response.status).to eq(403)
	end

	it 'result -1, -2 when params is wrong' do
		post :create, :type => 'aa', :id => 1
		expect(response.body).to eq('-1')

		delete :destroy, :type => 'aa', :id => 1
		expect(response.body).to eq('-1')

		post :create, :type => 'Thing', :id => -1
		expect(response.body).to eq('-2')

		delete :destroy, :type => 'Thing', :id => -1
		expect(response.body).to eq('-2')
	end
end
