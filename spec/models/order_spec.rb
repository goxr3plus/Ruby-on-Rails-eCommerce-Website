require "rails_helper"

RSpec.describe Order, :type => :model do
  let(:order) { create(:order) }
  it 'generate value' do
    puts order.attributes
    puts order.user.attributes
  end
end