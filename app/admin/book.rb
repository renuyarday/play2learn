ActiveAdmin.register Book do
  menu priority: 3

  actions :all, :except => [:destroy]

  index do
    column "Cover Image" do |book|
      image_tag book.cover_image.url
    end
    column :title
    column :author
    column "Categories" do |book|
      simple_format "<ul>#{book.categories.map { |category| "<li>#{category.name}</li>" }.join}</ul>"
    end
    column "Link to Book" do |book|
      link_to book.link
    end
    default_actions
  end

  show do |book|
    attributes_table do
      row :title
      row :author
      row "Link to Book" do
        link_to book.link
      end
      row "Category" do
        simple_format "<ul>#{book.categories.map { |category| "<li>#{category.name}</li>" }.join}</ul>"
      end
      row "Summary" do
        simple_format book.summary
      end
      row "Cover Image" do
        image_tag(book.cover_image.url)
      end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Category Details" do
      f.input :title
      f.input :author
      f.input :summary, :as => :text
      f.input :categories, :as => :check_boxes
      f.input :link, :as => :url
      f.input :cover_image, :as => :file
    end
    f.buttons
  end
end