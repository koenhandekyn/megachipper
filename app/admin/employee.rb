ActiveAdmin.register Employee do

  permit_params :id,
                :number,
                :firstname,
                :lastname,
                :socsec_id,
                :regime_raw,
                :hour_rate,
                :hour_rate_bonus,
                :employer_id

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Employee" do
      f.input :firstname
      f.input :lastname
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

  index do
    selectable_column
    column :firstname
    column :lastname
    column :number
    column :socsec_id
    column :hour_rate
    column :hour_rate_bonus
    column :employer_id
    actions
  end

end
