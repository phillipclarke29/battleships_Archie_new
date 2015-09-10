require 'player'

describe Player do
  let(:ship){double :ship}

  it 'has a board' do
    expect(subject).to respond_to(:board)
  end

  it 'has ships' do
    expect(subject).to respond_to(:ships)
  end

  it 'can report miss positions' do
    p = Player.new
    p.receive_miss('A1')
    expect(p.misses).to include('A1')
  end

  it 'can report hit positions' do
    p = Player.new
    p.receive_hit('A1')
    expect(p.hits).to include('A1')
  end

  it 'can report a hit' do
    p = Player.new
    ship = Ship.new('A1')
    p.place(ship)
    expect(p.receive_hit('A1')).to eq('hit')
  end

  it 'can report a miss' do
    p = Player.new
    ship = Ship.new('A1')
    p.place(ship)
    expect(p.receive_miss('B1')).to eq('miss')
  end

  it 'can lose' do
    p = Player.new
    expect(p.lost).to eq('Game Over - You Lose')
  end

  it 'can report if not all ships are sunk' do
    p = Player.new
    ship = Ship.new('A1')
    p.place(ship)
    expect(p.lost).to eq('Try again')
  end

  it 'can place ships' do
    p = Player.new
    ship = Ship.new('A1')
    p.place(ship)
    expect(p.ships).to include(ship)
  end

  # it 'is expected to respond to check_ships' do
  #   expect(subject).to respond_to(:check_ships)
  # end

  it 'will raise an error if ships overlap' do
    player = Player.new
    ship1 = Ship.new('A1')
    player.place(ship1)
    ship2 = Ship.new('A1')
    expect{player.place(ship2)}.to raise_error "Ships may not overlap!"
  end

  describe "#missile" do

   it 'can fire a missile' do
    expect(Player.new).to respond_to(:fire).with(1).argument

   end
   it 'checks if the missile has missed a ship' do
    p = Player.new
    expect(p.fire("A1")).to eq ("missed!")
  end

  it 'checks if the missile has hit a ship' do
   p = Player.new
   ship = Ship.new("A2")
   p.place(ship)
   expect(p.fire("A2")).to eq ("hit!")
 end

  end
end

# Player

#   can place ships
#   can tell us when a ship is hit
#   can report hit positions
#   can report miss positions
#   will lose if all ships are hit
