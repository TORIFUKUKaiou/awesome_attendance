ActiveAdmin.register User do
  permit_params :org_id, :email, :name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :org
    column :name
    column :email
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :org
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
