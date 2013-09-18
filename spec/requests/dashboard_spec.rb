require 'spec_helper'

describe "Dashboard" do
  it 'visits index' do
    visit root_path
    expect(response.status).to eq 200
  end
end
