FactoryBot.define do
  factory :item do
      product_name           { 'item01' }
      introduction           { 'item01です' }
      condition_id           { '3' }
      category_id            { '3' }
      prefecture_id          { '14' }
      shipment_id            { '3' }
      delivery_charge_id     { '2' }
      price                  { '30000' }
    after(:build) do |item|  
      item.image.attach(io: File.open('spec/fixtures/test.jpg'), filename: 'test.jpg', content_type: 'image/jpg')
    end
  end
end
