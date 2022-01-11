require 'rails_helper'

RSpec.feature "Users can add item to cart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one" do
    # ACT
    visit root_path

    expect(page).to have_text 'My Cart (0)'

    page.find('.product', match: :first).find('.actions').click_on 'Add'

    expect(page).to have_text 'My Cart (1)'

    # DEBUG / VERIFY
    save_screenshot
  end

end