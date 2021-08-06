ActiveAdmin.register Invitation do
    permit_params :email
    form do |f|
        f.inputs do
          f.input :email
        end
        f.actions
      end
end
  