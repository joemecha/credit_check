# require 'pry'
class CreditCard
  attr_reader :card_number, :credit_limit, :valid

  def initialize(card_number, credit_limit)
    @card_number = card_number
    @credit_limit = credit_limit
  end

  def card_number
    @card_number
  end

  def limit
    @credit_limit
  end

  def is_valid?
    # I'm certain there's a way to run from credit_check.rb but don't know how
    i = 0
    sub_results = []
    valid = nil
    sub_results = @card_number.split('')
    while i < @card_number.length
      sub_results[i] = sub_results[i].to_i * 2
      if sub_results[i] >= 10
        sub_results[i] = sub_results[i].to_s.split('')
        sub_results[i].map! { |string| string.to_i }
        sub_results[i] = sub_results[i].reduce(0, :+)
      end
      i += 2
    end

    #Sum results & valid if divisible by 10
    sub_results.map! { |string| string.to_i }
    if sub_results.reduce(0, :+) % 10 == 0
      true
    else
      false
    end

  end

  def last_four
    @card_number[-4, 4]
  end
end
