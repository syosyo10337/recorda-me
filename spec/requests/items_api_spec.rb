require 'rails_helper'

RSpec.describe 'Items_API', type: :request do
  before do
    @user = FactoryBot.create(:user, :with_items)
    sign_in @user
  end

  it 'loads all items' do
    get api_items_path
    expect(response).to have_http_status('200')
    json = JSON.parse(response.body)
    expect(json.length).to eq(12)
  end

  it 'update item' do
    get api_items_path
    json = JSON.parse(response.body)
    first_item_id = json[0]['id']
    patch api_item_path(first_item_id), params: {
      name: 'testing_item',
      item: { name: 'testing_item' }
    }
    expect(response).to have_http_status('200')

    get api_items_path
    json = JSON.parse(response.body)
    expect(json[0]['name']).to eq 'testing_item'
  end
end