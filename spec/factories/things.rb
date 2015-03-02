FactoryGirl.define do
  factory :thing do
    title 'title'
    subtitle 'subtitle'
    official_site 'official_site'
    body 'body'
  end

  factory :thing_with_photos, :parent => :thing do |thing|
    photos { build_list :photo, 3 }
  end
end