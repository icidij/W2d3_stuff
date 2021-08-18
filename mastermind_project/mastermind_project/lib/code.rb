class Code

attr_accessor :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr)
    arr.all? {|item| POSSIBLE_PEGS.include?(item.upcase)}
  end
  def initialize(arr)
    raise "Error" if !Code.valid_pegs?(arr)
    @pegs = arr.map(&:upcase)

  end



  def self.random(num)
     Code.new(Array.new(num, POSSIBLE_PEGS.keys.sample))
    
  end



  def self.from_string(string)
    # a = Code.new(Array.new(string.length, ["R", "G", "B", "Y"].sample))

    # string.each_char.with_index {|char, i| a.pegs[i] = char.upcase}

    # a
    Code.new(string.split(""))





  end


  def [](index)

   @pegs[index]
  end


  def length

    @pegs.length
  end


  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index {|spot, i| count += 1 if spot == @pegs[i]}
    count


  end





  def num_near_matches(guess)
    near_matches = 0
    unmatched_pegs = []
    unmatched_guess_pegs = []

    guess.pegs.each_with_index do |spot, i| 
      
      if !(spot == @pegs[i])
        unmatched_pegs << @pegs[i]

        unmatched_guess_pegs << spot 

        
      end
      unmatched_pegs
      unmatched_guess_pegs
    end

    
    



    upcount = Hash.new(0)
    ugpcount = Hash.new(0)
    unmatched_guess_pegs.each {|color| ugpcount[color] += 1}
    
    unmatched_pegs.each {|color| upcount[color] += 1}

    upcount.each {|k, v| near_matches += 1 if ugpcount.has_key?(k)}


  near_matches
end

def ==(arg)

  return false if @pegs.length != arg.pegs.length
  
  
  
  self.pegs.each_with_index do |item, i|  
    if !(item == arg.pegs[i])
      return false
    end

  end
true
end


end