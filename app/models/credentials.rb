ActiveAdmin.register Credential do
    permit_params :client_id, :secret_key, :publishable_key
    form do |f|
        f.inputs do
          f.input :client_id
          f.input :secret_key
          f.input :publishable_key
        end
        f.actions
      end
end
  