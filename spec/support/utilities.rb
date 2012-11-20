def refresh_categories
	Category.delete_all
	
    @category = Category.new :name => "Foo", 
      :badge_image => File.open("#{Rails.root}/db/icon_badge.gif")
   	@category.save!   
end