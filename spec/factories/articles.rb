FactoryBot.define do
  
  factory :article, class: Article do
    title { "test_title" }
  end

  factory :article2, class: Article do
    title { "test_title2" }
  end
end