require 'rails_helper'

context 'viewing images' do

  let!(:kitten){Image.create(title:'Kitten', description:'Gangster Kitten')}

  scenario 'lets a user view an image' do
    #sign in
    #create image

    visit '/images'
    click_link 'Kitten'
    expect(page).to have_content 'Kitten'
    expect(current_path).to eq "/images/#{kitten.id}"
  end
end
