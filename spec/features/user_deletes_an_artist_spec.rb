require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they are redirected to the index page after deleting an artist" do
    artist = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    visit artist_path(artist)

    click_on "Delete Artist"

    expect(current_path).to eq "/artists"
    expect(page).to have_no_content "Bob Marley"
  end
end
