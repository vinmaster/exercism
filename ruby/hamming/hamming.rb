class Hamming
  VERSION = 1

  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length
    
    zipped = strand1.chars.zip(strand2.chars)
    distance = zipped.reduce(0) do |sum, strands|
      sum += 1 if strands[0] != strands[1]
      sum
    end
  end
end
