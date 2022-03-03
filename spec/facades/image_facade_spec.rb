require 'rails_helper'

RSpec.describe ImageFacade, type: :facade do
  context 'class methods', :vcr do
    describe '::search_for_listing_image' do
      it 'returns an image object' do
        image = ImageFacade.search_for_listing_image('2015 kia sorento', 'blue')

        expect(image).to be_a(Image)
      end

      it 'returns an image even if given an undefined color' do
        image = ImageFacade.search_for_listing_image('2015 kia sorento', 'undefined_color')

        expect(image).to be_a(Image)
      end

      it 'returns default image if query is has no return' do
        image = ImageFacade.search_for_listing_image('&D*^$T&^#&%$7625hdfsjjk', 'red')

        expect(image.url).to eq('/assets/broken_car_image.png')
      end
    end

    describe '::allowed_colors' do
      it 'returns same color if color passed is allowed' do
        color = ImageFacade.allowed_color("BLUE")
        expect(color).to eq("BLUE")
      end

      it 'returns undefined color if color passed is not allowed' do
        color = ImageFacade.allowed_color("**&&^^%%$$#")
        expect(color).to eq("IMG_DOMINANT_COLOR_UNDEFINED")
      end
    end

    describe '::default_image' do
      it 'returns the default image poro' do
        default_image = ImageFacade.default_image

        expect(default_image.title).to eq('image_not_found')
        expect(default_image.url).to eq('/assets/broken_car_image.png')
        expect(default_image.height).to eq(1254)
        expect(default_image.width).to eq(1880)
      end
    end
  end
end
