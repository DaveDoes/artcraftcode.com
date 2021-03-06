require_relative './measurement.rb'
require_relative './size.rb'
require_relative './custom_hat_size.rb'
require_relative './data/hat_sizes.rb'

module Libraries
  NEEDLES = [
    { 2 => 0 },     { 2.25 => 1 },    { 2.5 => 1.5 },   { 2.75 => 2 },
    { 3 => 2.5 },   { 3.25 => 3 },    { 3.5 => 4 },     { 3.75 => 5 },
    { 4 => 6 },     { 4.5 => 7 },     { 5 => 8 },       { 5.5 => 9 },
    { 6 => 10 },    { 6.5 => 10.5 },  { 8 => 11 },      { 9 => 13 },
    { 10 => 1 }
  ]

  YARNS = [
    { 'lace' => { position: 0, factor: 1.6 } },
    { 'light fingering' => { position: 1, factor: 1.4 } },
    { 'fingering' => { position: 2, factor: 1.3 } },
    { 'sport' => { position: 3, factor: 1.2 } },
    { 'dk' => { position: 4, factor: 1.1 } },
    { 'worsted' => { position: 5, factor: 1 } },
    { 'aran' => { position: 6, factor: 0.9 } },
    { 'bulky' => { position: 7, factor: 0.7 } },
    { 'super bulky' => { position: 8, factor: 0.4  }}
  ]

  def self.hat_sizes
    datum = HatSizes::DATA
    sizes = datum.map do |data|
      m = Measurement.new("circumference", data[:value])
      s = Size.new(data[:label], [m])
      CustomHatSize.new(s, data[:height], data[:ribbing])
    end
    sizes
  end

  HAT_SIZES = self.hat_sizes
end
