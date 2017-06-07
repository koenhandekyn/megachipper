class TimeRegistrationsController < InheritedResources::Base

  private

    def time_registration_params
      params.require(:time_registration).permit(:prestation_date, :work_order_id, :employee_id, :employee_number, :hours, :pay_code)
    end
end

