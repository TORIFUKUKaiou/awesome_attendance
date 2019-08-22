ActiveAdmin.register Token do
  permit_params :label, :key

  form do |f|
    f.inputs do
      f.inputs :label
      f.inputs :key
    end
    f.actions
  end
end
