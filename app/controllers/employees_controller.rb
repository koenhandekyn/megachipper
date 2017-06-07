class EmployeesController < InheritedResources::Base

  private

    def employee_params
      params.require(:employee).permit(:number, :name, :regime, :hour_rate, :hour_rate_bonus, :employer_id, :socsec_id)
    end
end

