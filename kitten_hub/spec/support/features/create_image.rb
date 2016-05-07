module Features

  def create_image
    visit '/images'
    click_link 'Upload an image'
    fill_in 'Title', with: 'Kitten'
    fill_in 'Description', with: 'Gangster Kitten'
    click_button 'Upload'
  end
  
end
