feature 'adding new bookmark' do
  scenario 'the user wants to add a url to his bookmarks' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://github.com/')
    fill_in('title', with: 'Github')
    click_button 'Submit'
    expect(page).to have_link('Github', href: 'https://github.com/')
  end
end
