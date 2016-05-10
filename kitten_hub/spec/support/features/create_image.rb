module Features

  def create_image
    visit '/images'
    click_link 'Upload an image'
    fill_in 'Title', with: 'Test'
    fill_in 'Description', with: 'Gangster Kitten'
    attach_file 'Picture', fixture_image_path
    click_button 'Upload'
  end

  def fixture_image_path
    Rails.root.join('spec', 'support', 'test.jpg')
  end
end
