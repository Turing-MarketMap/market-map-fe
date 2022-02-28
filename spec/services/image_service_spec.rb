require 'rails_helper'

RSpec.describe ImageService, type: :service do
  context 'class methods', :vcr do
    describe '::conn' do
      it 'returns Faraday connection' do
        image = ImageService.conn

        expect(image).to be_a(Faraday::Connection)
      end
    end

    describe '::search_images' do
      it 'returns hash of matched images' do
        search = ImageService.search_images('2015 kia sorrento', 'blue')

        expect(search).to be_a(Hash)
      end
    end
  end
end
