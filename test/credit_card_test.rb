require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_card'

class CreditCardTest < Minitest::Test
  def test_it_exists
    credit_card = CreditCard.new("5541808923795240", 5000)
    assert_instance_of CreditCard, credit_card
  end

  # credit card has a card number
  def test_it_has_a_number
    credit_card = CreditCard.new("5541808923795240", 5000)
    assert_equal "5541808923795240", credit_card.card_number
  end

  def test_it_has_a_limit
    credit_card = CreditCard.new("5541808923795240", 5000)
    assert_equal 5000, credit_card.limit
  end

  def test_is_valid_if_number_is_valid
    valid_card = CreditCard.new("5541808923795240", 5000)
    assert_equal true, valid_card.is_valid?
  end

  def test_is_not_valid_if_number_is_invalid
    fake_card = CreditCard.new("4024007106512380", 5000)
    assert_equal false, fake_card.is_valid?
  end

  def test_has_last_four_digits
    credit_card = CreditCard.new("5541808923795240", 5000)
    assert_equal "5240", credit_card.last_four
  end
end 
