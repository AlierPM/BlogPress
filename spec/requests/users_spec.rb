# spec/requests/users_spec.rb

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('Find All the Best Authors Here')
    end
  end

  describe 'GET /show' do
    let(:user) { create(:user) }

    it 'returns a successful response' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}"
      # expect(response.body).to include("Details for user #{user.name}")
      expect(response.body).to include('<h1>The Best BlogPress User</h1>')
      expect(response.body).to include('<p>Know More About Your Best Author Here</p>')
    end
  end
end
