require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the page showing all artists" do
  artist = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  
  visit artists_path

  expect(page).to have_content "Bob Marley"

  click_on "Bob Marley"

  expect(current_path).to eq "/artists/#{artist.id}"
  end
end
