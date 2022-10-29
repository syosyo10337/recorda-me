require 'rails_helper'

RSpec.describe Log, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item, user: user) }

  # amountが1回の記録で120minが上限であること/最小でも1min
  it 'is invalid with greater than 120' do
    log = FactoryBot.build(:log, item: item, amount: 121)
    log.valid?
    expect(log.errors[:amount]).to include('は120以下の値にしてください')
  end

  it 'is invalid with 0 amount' do
    log = FactoryBot.build(:log, item: item, amount: 0)
    log.valid?
    expect(log.errors[:amount]).to include('は0より大きい値にしてください')
  end

  # ログが時系列順にdescであること。
  let!(:log) { FactoryBot.create(:log) }
  let!(:log) { FactoryBot.create(:log, :created_yesterday) }
  let!(:log) { FactoryBot.create(:log, :created_two_days_ago) }
  it 'comes recently created first' do
    expect(log).to eq Log.first
  end
  # itemsIDがあること。
  it 'is invalid without item_id' do
    log = FactoryBot.build(:log, item: nil)
    log.valid?
    expect(log.errors[:item_id]).to include('を入力してください')
  end
end
