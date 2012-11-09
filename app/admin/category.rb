ActiveAdmin.register Category do
  index do
    column "Badge" do |category|
      image_tag(category.badge_image.url)
    end
    column :name
    default_actions
  end

  show do |category|
    attributes_table do
      row :name
      row "Badge" do
        image_tag(category.badge_image.url)
      end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :badge_image, :as => :file
    end
    f.buttons
  end
end