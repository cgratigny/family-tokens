class TransactionType < ClassyEnum::Base
  def token_multiplier
    -1
  end

  def balance_multiplier
    -1
  end

  def affects_tokens?
    false
  end
end

class TransactionType::Purchase < TransactionType
end

class TransactionType::Withdrawal < TransactionType
end

class TransactionType::Deposit < TransactionType
  def balance_multiplier
    1
  end
end

class TransactionType::Transfer < TransactionType
  def affects_tokens?
    true
  end

  def balance_multiplier
    1
  end
end
