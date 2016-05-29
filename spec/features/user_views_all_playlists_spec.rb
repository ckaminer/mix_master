require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see the page showing all playlists" do
  playlist = Playlist.create(name: "Fresh Beats")

  visit playlists_path

  expect(page).to have_content "Fresh Beats"

  click_on "Fresh Beats"

  expect(current_path).to eq playlist_path(playlist)
  end
end
