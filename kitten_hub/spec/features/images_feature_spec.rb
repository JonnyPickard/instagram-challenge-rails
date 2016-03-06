require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to upload an image' do
      visit '/images'
      expect(page).to have_content "No images yet!"
      expect(page).to have_link "Upload an image"
    end
  end

  context 'images have been added' do
    before do
      Image.create(title: 'Kitten')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content("Kitten")
      expect(page).not_to have_content("No images yet!")
    end
  end

  context 'creating images' do #uploading?
    scenario 'prompts user to fill out a form then displays the image' do
      visit '/images'
      click_link 'Upload an image'
      fill_in 'Title', with: 'Kitten'
      fill_in 'Description', with: 'Gangster Kitten'
      click_button 'Upload'
      expect(page).to have_content 'Kitten'
      expect(current_path).to eq '/images'
    end
  end

  context 'viewing images' do

    let!(:kitten){Image.create(title:'Kitten', description:'Gangster Kitten')}

    scenario 'lets a user view an image' do
      visit '/images'
      click_link 'Kitten'
      expect(page).to have_content 'Kitten'
      expect(current_path).to eq "/images/#{kitten.id}"
    end
  end

  context 'editing images' do

    before { Image.create(title:'Kitten', description:'Gangster Kitten') }

    scenario 'lets a user edit an image title' do
      visit '/images'
      click_link 'Edit Kitten'
      fill_in 'Title', with: 'Miaowster'
      click_button 'Update Title'
      expect(page).to have_content 'Miaowster'
      expect(current_path).to eq '/images'
    end
  end

  context 'deleting images' do

    before { Image.create(title:'Kitten', description:'Gangster Kitten') }

    scenario 'lets a user delete an image' do
      visit '/images'
      click_link 'Delete Kitten'
      expect(page).to_not have_content('Kitten')
      expect(page).to have_content('Image Deleted')
    end
  end

end
