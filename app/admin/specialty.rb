ActiveAdmin.register Specialty do
  menu priority: 5


  config.batch_actions = false
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  controller do
    def new
      @specialty = Specialty.new(departament_id: params[:departament])
      super
    end 
      private 
  end 


  index do
    column :name
    column :profession
    column :training_period
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  show do
    attributes_table :name, :departament_id, :profession, :ochno, :zaochno, :ochno_price, :zaochno_price, :training_period
  end

  permit_params :name, :departament_id, :ochno, :zaochno, :ochno_price, :zaochno_price,  :profession, :training_period

end
