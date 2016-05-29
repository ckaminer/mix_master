require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see the page with the form to edit the playlists's info" do
    playlist = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song = create(:song, title: "New Song")
    new_name = "Updated Name"

    visit playlist_path(playlist)
    click_on "Edit Playlist"

    expect(current_path).to eq edit_playlist_path(playlist)

    fill_in "playlist_name", with: new_name
    uncheck("song-#{first.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(current_path).to eq playlist_path(playlist)
    expect(page).to have_content "Updated Name"
    expect(page).to have_link new_song.title
    expect(page).to_not have_link first.title
  end
end
