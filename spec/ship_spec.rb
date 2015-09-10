require 'ship'

describe Ship do
  it 'has a position when created' do
    ship = Ship.new('B4')
    expect(ship.position).to eq('B4')
  end

  it "increases hits by 1 if was hit" do
    ship = Ship.new('A1')
    num_of_hits = ship.hits
    ship.was_hit
    expect(ship.hits).to eq(num_of_hits+1)
  end

  it 'can be sunk' do
    ship = Ship.new('A1')
    expect(ship.was_hit).to eq("sunk")
  end

  it 'is afloat' do
    ship = Ship.new('A1')
    expect(ship.afloat?).to be_truthy
  end

  it "not sunk when initiated" do
    ship = Ship.new("D5")
    expect(ship.afloat?).to be_truthy
  end

  it "tells us if it is sunk" do
  ship = Ship.new("D5")

  end

  


end
