json.extract! time_registration, :id, :prestation_date, :work_order_id, :employee_id, :employee_number, :hours, :pay_code, :created_at, :updated_at
json.url time_registration_url(time_registration, format: :json)
