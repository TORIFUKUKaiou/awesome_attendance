ActiveAdmin.register Event do
  permit_params :name, :date, :place_id
end
