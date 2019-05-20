feature 'Homepage' do

  scenario 'Says Hello world' do
    visit('/')
    expect(page).to have_content 'Hello world'
  end

end
