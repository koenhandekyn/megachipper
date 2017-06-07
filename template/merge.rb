require 'rubyXL'
require 'active_support/all'

start = Date.new(2017,6,1)

month = start.strftime("%B")
employee_number = "7"
employee_name = "STIJN"


workbook = RubyXL::Parser.parse("uurkaart.xlsx")

groen = workbook['groen']
groen[0][2].change_contents(month)
groen[1][1].change_contents(employee_number)
groen[1][2].change_contents(employee_name)

groen[0+27][2].change_contents(month)
groen[1+27][1].change_contents(employee_number)
groen[1+27][2].change_contents(employee_name)

(0..17).each do |i|
  day_of_month, day = case (start+i).wday
    when 1..5 then [i+1, (start+i.days).strftime("%a").upcase]
    when 6 then ['', 'TOT']
    when 7 then ['', '']
  end
  groen[1][3+i].change_contents(day)
  groen[2][3+i].change_contents(day_of_month)
end

(18..(start.end_of_month.day)).each do |i|
  day_of_month, day = case (start+i).wday
    when 1..5 then [i+1, (start+i.days).strftime("%a").upcase]
    when 6 then ['', 'TOT']
    when 7 then ['', '']
  end
  groen[1+27][3-18+i].change_contents(day)
  groen[2+27][3-18+i].change_contents(day_of_month)
end

workbook.write("merged.xlsx")
