FactoryGirl.define do

  factory :snap do
    association :user
    image    Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/test_image.png", "image/jpg")
    caption  'ipsem lorem'
  end
end