  class TokenAffectOptions < ClassyEnum::Base
  end

  class TokenAffectOptions::Earn < TokenAffectOptions
    def multiplier
      1
    end
  end

  class TokenAffectOptions::Spend < TokenAffectOptions
    def multiplier
      -1
    end
  end
