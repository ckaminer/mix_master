require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the page with the form to edit the artist's info" do
    artist = Artist.create(name: "Bob Marli", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    visit artist_path(artist)
    new_name = "Bob Marley"

    click_on "Edit Artist"

    expect(current_path).to eq "/artists/#{artist.id}/edit"
    fill_in "artist_name", with: new_name
    click_on "Update Artist"

    expect(current_path).to eq "/artists/#{artist.id}"
    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
