  class TokenAffectOptions < ClassyEnum::Base
  end

  class TokenAffectOptions::Earn < TokenAffectOptions
    def multiplier
      1
    end

    def symbol
      "+"
    end

    def color
      "green"
    end
  end

  class TokenAffectOptions::Spend < TokenAffectOptions
    def multiplier
      -1
    end

    def symbol
      "-"
    end

    def color
      "gray"
    end
  end
