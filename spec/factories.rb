FactoryGirl.define do 
 
  factory :user do
    name "anusha" 
    email "anusha@gmail.com" 
    password "anusha"
    password_confirmation "anusha"
  end

  factory :invalid_user, parent: :user do |f|
    f.name nil
  end


   factory :question do
   	content "What is TDD?"
   	user
   end
end