require 'spec_helper'

describe "Places" do
  it 'visits index' do
    visit places_path
    expect(response.status).to eq 200
  end
end
