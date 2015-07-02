feature 'Viewing links' do

  before(:each) do 
    Link.create(url: 'http//www.makersacademy.com',
                title: 'Makers Academy',
                tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http//www.google.com',
                title: 'Google',
                tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http//www.zombocom.com',
                title: 'Zombocom',
                tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http//www.bubblebobble.com',
                title: 'Bubble Bobble',
                tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http//www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')

    end
  end

  scenario 'I can filter by links by tags'do
    visit '/tags/bubbles'
    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('code.org')
    expect(page).to have_content('Zombocom')
    expect(page).to have_content('Bubble Bobble')
  end
end
