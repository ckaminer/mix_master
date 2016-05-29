require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see the page with the form to edit the playlists's info" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = Playlist.create(name: "Fresh Beeetz", song_ids: [song_one.id, song_three.id])
    new_name = "Fresh Beats"
    visit playlist_path(playlist)

    click_on "Edit Playlist"

    expect(current_path).to eq edit_playlist_path(playlist)

    fill_in "playlist_name", with: new_name
    check("song-#{song_one.id}")
    check("song-#{song_two.id}")
    click_on "Update Playlist"

    expect(current_path).to eq playlist_path(playlist)
    expect(page).to have_content "Fresh Beats"
    expect(page).to have_link "B Title"
    expect(page).to have_no_link "A Title"
  end
end
