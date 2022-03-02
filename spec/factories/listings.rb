FactoryBot.define do
  factory :listings do

    transient do
      listing_count { 10 }
    end

    listings { build_list(:listing, listing_count) }

    initialize_with { new(listings) }
  end
end
