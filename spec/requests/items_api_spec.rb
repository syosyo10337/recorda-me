require 'rails_helper'

RSpec.describe 'Items_API', type: :request do
  it 'loads all items' do
    user = FactoryBot.create(:user, :with_items)

    sign_in user
    get api_items_path
    expect(response).to have_http_status('200')
    json = JSON.parse(response.body)
    expect(json.length).to eq(12)
  end
end