require 'rubyXL'

class BlankTimeSheet

  def self.workbook
    @@workbook ||= begin
      puts "#{Time.now} workbook source parsing started"
      workbook = RubyXL::Parser.parse("template/uurkaart.xlsx")
      puts "#{Time.now} workbook source parsed"
      workbook
    end
  end

  def self.create(start:, employee_number:, employee_name:, employee_firstname:)

      # month = start.strftime("%B")
      month = I18n.l(start, format: :month)
      # TODO cache this?
      # TODO reuse this accross employees

      groen = workbook['groen']
      groen[0][2].change_contents(month)
      groen[1][1].change_contents(employee_number)
      groen[1][2].change_contents(employee_name)

      groen[0+27][2].change_contents(month)
      groen[1+27][1].change_contents(employee_number)
      groen[1+27][2].change_contents(employee_name)

      offset = (start+17).wday <= 5 ? (start+17).wday : 0

      (0..(17-offset)).each do |i|
        day_of_month, day = case (start+i).wday
          when 1..5 then [i+1, I18n.l(start+i.days, format: :day).upcase]
          when 6 then ['', 'TOT']
          when 0 then ['', '']
        end
        groen[1][3+i].change_contents(day)
        groen[2][3+i].change_contents(day_of_month)
      end

      ((18-offset)..(start.end_of_month.day-1)).each do |i|
        day_of_month, day = case (start+i).wday
          when 1..5 then [i+1, I18n.l(start+i.days, format: :day).upcase]
          when 6 then ['', 'TOT']
          when 0 then ['', '']
        end
        groen[1+27][3-(18-offset)+i].change_contents(day)
        groen[2+27][3-(18-offset)+i].change_contents(day_of_month)
      end

      wit = workbook['wit']
      (0..4).each do |i|
        wit[0][0+i*7].change_contents(month)
        wit[0][1+i*7].change_contents(employee_firstname)
      end

      (0..(start.end_of_month.day-1)).each do |i|
        day_of_month, day = case (start+i).wday
          when 1..6 then [i+1, I18n.l(start+i.days, format: :day).upcase[0..1]]
          when 0 then ['', 'TOT']
        end
        wit[2][i].change_contents(day_of_month)
        wit[3][i].change_contents(day)
      end

      result_path = "/tmp/#{month}_#{employee_number}.xlsx"
      workbook.write(result_path)
      puts "#{Time.now} workbook result written"
      result_path
  end

end
