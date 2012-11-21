FactoryGirl.define do

	factory :user do
		name "John Doe"
		email "jdoe@example.com"
		password "abcdefg"
		image_url "http://foo.com"
		facebook_token nil
		provider "facebook"
		uid "12345"
	end

	factory :book do
		title "Foo"
		link "http://foo.com"
		author "John Doe"
	end

	factory :answer do
		answer_text "Foo"
		is_correct true
		hint "right"
	end

	factory :facebook_oauth_hash, class: OpenStruct do
		provider "facebook"
		uid "12345"
		extra OpenStruct.new({
				raw_info: OpenStruct.new({
						name: "John Doe"
				})
		})
		info OpenStruct.new({
				image: "http://foo.com",
				email: "jdoe@example.com"
		})
		credentials OpenStruct.new({
				:token => 'ABCDEFGHI',
				:expires_at => 1321747205,
				:expires => true
		})
	end
end