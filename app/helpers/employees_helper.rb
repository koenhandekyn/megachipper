module EmployeesHelper

  def prestation_dates
    (0..4).map { |i| prestation_date(i) }
  end

  def prestation_date(wday)
    @period_start+wday.days
  end

  def time_sheet_rows
    TimeSheetRow.where(employee_id: @employee.id, date: @period_start)
                .order(created_at: :asc)
  end

  def current?(wday, v1, v2)
    prestation_date(wday).month==month() ? v1 : v2
  end

  def disabled?(wday)
    current?(wday, {}, { disabled: true })
  end

  def period?(i)
    params[:period].to_i==i ? 'current' : ''
  end

  def day_of_month(wday)
    prestation_date(wday).day
  end

  def prestation(work_order_id, wday)
    TimeRegistration.find_by(employee_id: @employee.id, prestation_date: prestation_date(wday), work_order_id: work_order_id)
  end

  def month_name(month)
    I18n.l(start_of_month(month), format: :month)
  end

  def start_of_month(month)
    Date.new(Time.now.year, month, 1)
  end

  def period
    params[:period].to_i
  end

  def month
    params[:month].to_i
  end

  def week_number(date)
    date.strftime('%W').to_i
  end

  def previous_month_path()
    "?month=#{month()-1}&period=4"
  end

  def next_month_path()
    "?month=#{month()+1}&period=0"
  end

end
