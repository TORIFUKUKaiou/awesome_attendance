ActiveAdmin.register Token do
  permit_params :label, :key, :digest_hash

  index do
    selectable_column
    id_column
    column :label
    column :digest_hash
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.inputs :label
      f.inputs :key
    end
    f.actions
  end
end
