json.extract! employee, :id, :number, :name, :regime, :hour_rate, :hour_rate_bonus, :employer_id, :socsec_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
