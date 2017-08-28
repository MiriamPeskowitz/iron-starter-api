FactoryGirl.define do  
    factory :campaign do  
        title { Faker::Lorem.word } 
        description { Faker::Lorem.paragraph }
        goal { Faker::Number.between(1000, 1000000) } 
        pledged { Faker::Number.between(0, 10) }
        deadline { Faker::Time.between(DateTime.now + 15, DateTime.now + 30) }
    end 
end
        