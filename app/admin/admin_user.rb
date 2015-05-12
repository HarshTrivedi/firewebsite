ActiveAdmin.register AdminUser do
  menu label: "Admin Users" , :priority => 2
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    column :email
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
