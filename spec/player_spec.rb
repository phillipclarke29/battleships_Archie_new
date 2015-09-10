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

end

# Player

#   can place ships
#   can tell us when a ship is hit
#   can report hit positions
#   can report miss positions
#   will lose if all ships are hit
