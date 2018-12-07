class GNC
  # distance
  # angle
  # altitude
  DISTANCE = 8000
  MAX_ANGLE = Math::PI/2
  MIN_ANGLE = -Math::PI/2

  def self.distance
    DISTANCE
  end

  def self.altitude
    distance * Math::cos(angle)
  end

  def self.angle
    rand( min_angle .. max_angle )
  end

  def self.min_angle
    MIN_ANGLE
  end

  def self.max_angle

    MAX_ANGLE
  end
end

describe GNC do
  it { expect(GNC.altitude).not_to be(nil) }
  it {
    expect(GNC).to receive(:distance).and_return(8000)
    GNC.altitude
  }

  it {
    expect(Math).to receive(:cos).and_return(1)
    GNC.altitude
  }
  it {
    expect(GNC.min_angle .. GNC.max_angle).to cover(1)
  }

  it 'Вы идите математику учите' do
    expect(GNC::MAX_ANGLE).to eq(Math::PI/2)
  end
end