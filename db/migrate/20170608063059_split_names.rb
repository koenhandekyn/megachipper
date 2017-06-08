class SplitNames < ActiveRecord::Migration[5.1]
  def up
    Employee.all.each do |employee|
      names = employee.name.lstrip.split
      employee.lastname = names[0]
      employee.firstname = names[1]
      employee.save
    end
  end
end
