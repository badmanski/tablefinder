require 'spec_helper'

describe Place do
  before(:all) do
    Place.destroy_all
    @place = Place.make!
  end

  it 'converts name to a string' do
    expect(@place.to_s).to eq @place.name
  end
end
