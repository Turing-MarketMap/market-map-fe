require 'rails_helper'

RSpec.describe Image, type: :poro do
  describe 'object properties' do
    it 'exists and has attributes' do
      data = 
      {
        title: 'Used 2015 Kia Sorento for Sale Near Me | Edmunds',
        link: 'https://media.ed.edmunds-media.com/for-sale/30-5xykt4a64fg560469/img-1-600x400.jpg',
        image: {
          height: 400,
          width: 600
        }
      }
      
      image = Image.new(data)

      expect(image).to be_a(Image)
      expect(image).to have_attributes(title: 'Used 2015 Kia Sorento for Sale Near Me | Edmunds')
      expect(image).to have_attributes(url: 'https://media.ed.edmunds-media.com/for-sale/30-5xykt4a64fg560469/img-1-600x400.jpg')
      expect(image).to have_attributes(height: 400)
      expect(image).to have_attributes(width: 600)
    end
  end
end
