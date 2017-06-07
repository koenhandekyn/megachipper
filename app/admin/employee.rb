ActiveAdmin.register Employee do

  permit_params :id,
                :number,
                :name,
                :socsec_id,
                :regime_raw,
                :hour_rate,
                :hour_rate_bonus,
                :employer_id

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Employee" do
      f.input :name
      f.input :number
      f.input :socsec_id
      f.input :hour_rate
      f.input :hour_rate_bonus
      f.input :employer_id
      f.input :regime_raw, as: :text, input_html: { class: 'jsoneditor-target' }
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    actions
  end

end
