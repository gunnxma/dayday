FactoryGirl.define do
  factory :thing do
    title 'title'
    subtitle 'subtitle'
    official_site 'official_site'
    body 'body'
    token SecureRandom.hex
  end

  factory :thing_with_photos, :parent => :thing do |thing|
    photos { create_list :photo, 3, token: token }
  end
end