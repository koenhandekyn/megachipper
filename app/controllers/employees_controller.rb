class EmployeesController < ApplicationController
  before_action :set_employee, only: [:blank_time_sheet, :time_sheet, :show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/1/blank_time_sheet
  def blank_time_sheet
    # start = Time.now.beginning_of_month.to_date
    result_path = BlankTimeSheet.create(start: helpers.start_of_month(params[:month].to_i),
                                        employee_name: @employee.name,
                                        employee_firstname: @employee.firstname,
                                        employee_number: @employee.number)
    send_file(result_path,
      :filename => "#{month_name}_#{@employee.name}_#{@employee.number}.xlsx",
      :type => "application/xlsx")
  end

  # GET /employees/1/time_sheet
  def time_sheet
    start_of_month_wday = helpers.start_of_month(params[:month].to_i).wday

    @period_start = case start_of_month_wday
      when 0..5
        Date.new(Time.now.year, params[:month].to_i, 1)-start_of_month_wday.days+1.days+(helpers.period()*7).days
      when 6
        Date.new(Time.now.year, params[:month].to_i, 1)-start_of_month_wday.days+1.days+((helpers.period()+1)*7).days
    end
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.fetch(:employee, {})
    end
end
