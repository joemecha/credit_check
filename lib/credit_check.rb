card_number = "5541808923795240"

# Your Luhn Algorithm Here
i = 0
sub_results = []
valid = nil
sub_results = card_number.split('')

#2x every other digit and sum digits of integers >= 10
while i < card_number.length
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
  valid = true
else
  valid = false
end

# Output
## If it is valid, print "The number [card number] is valid!"
if valid == true
  puts "The number #{card_number} is valid!"
## If it is invalid, print "The number [card number] is invalid!"
elsif valid == false
  puts "The number #{card_number} is invalid!"
end
