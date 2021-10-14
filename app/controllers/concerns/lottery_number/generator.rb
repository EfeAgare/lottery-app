module LotteryNumber
  class Generator
    attr :numbers
  
    def initialize(n=1..49)
      @numbers = (n).to_a
    end
  
    def pick(n=1)
      numbers.sample(n).sort
    end
  
    def pick_winner
      pick(6)
    end
  end
end