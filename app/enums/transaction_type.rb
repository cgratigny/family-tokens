class TransactionType < ClassyEnum::Base
  def multiplier
    1
  end

  def affects_tokens?
    true
  end
end

class TransactionType::Purchase < TransactionType
  def multiplier
    -1
  end
end

class TransactionType::Deposit < TransactionType
  def affects_tokens?
    false
  end
end

class TransactionType::Withdrawal < TransactionType
  def multiplier
    -1
  end
end
