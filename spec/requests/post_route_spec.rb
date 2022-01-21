require 'rails_helper'

describe "post a pet route", :type => :request do
  # let!(:pets) { FactoryBot.create_list(:pet, 20)}

  before do
    post '/pets', params: { :name => 'Gina', :breed => 'German Shepard Mix', :species => 'Dog' }
  end

  it 'returns the breed name' do
    expect(JSON.parse(response.body)['breed']).to eq('German Shepard Mix')
  end

  it 'returns the pet species' do
    expect(JSON.parse(response.body)['species']).to eq('Dog')
  end

  it 'returns the pet name' do
    expect(JSON.parse(response.body)['name']).to eq('Gina')
  end

  it 'returns an ok status' do
    expect(response).to have_http_status(:ok)
  end
end