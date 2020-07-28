feature 'adding new bookmark' do
  scenario 'the user wants to add a url to his bookmarks' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://github.com/')
    click_button 'Submit'
    expect(page).to have_content('https://github.com/')
  end
end