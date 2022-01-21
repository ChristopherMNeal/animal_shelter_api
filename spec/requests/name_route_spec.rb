require 'rails_helper'

describe "search for an name route", :type => :request do
  let!(:pets) { FactoryBot.create_list(:pet, 10)}
  FactoryBot.create(:pet, :name => "Hel Goddess Of Death")

  before { get "/pets?name=#{Pet.first.name}"}
  before { get "/pets?name=Hel Goddess Of Death"}


  it 'returns one pet' do
    expect(JSON.parse(response.body).size).to eq(1)
  end
  
  it 'returns the pet with name: "Hel Goddess Of Death"' do
    expect(JSON.parse(response.body).first['name']).to eq('Hel Goddess Of Death')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end