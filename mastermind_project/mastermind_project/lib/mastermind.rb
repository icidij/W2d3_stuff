require_relative "code"
class Mastermind
attr_accessor :secret_code

    def initialize(num)

        @secret_code = Code.random(num)
       
    end


    def print_matches(arg)
        q = arg.pegs
        count = 0
        @secret_code.pegs.each_with_index {|item, i| count += 1 if item == q[i]}
        p count

        r = @secret_code.num_near_matches(arg)
        p r
        # s = Code.from_string(r).pegs
        # p s #r.Code.num_exact_matches(q)
    
    
    
    end
    def ask_user_for_guess


        p "Enter a code"
        
        q = Code.from_string(gets.chomp)

        p @secret_code.num_exact_matches(q)
        p @secret_code.num_near_matches(q)
        p @secret_code.num_exact_matches(q) == q.length

    end




end