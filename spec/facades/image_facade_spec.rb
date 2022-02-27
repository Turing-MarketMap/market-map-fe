require 'rails_helper'

RSpec.describe ImageFacade, type: :facade do
  context 'class methods', :vcr do
    describe '::search_for_listing_image' do
      it 'returns an image object' do
        image = ImageFacade.search_for_listing_image('2015 kia sorento', 'blue')
  
        expect(image).to be_a(Image)
      end
    end
  end
end
