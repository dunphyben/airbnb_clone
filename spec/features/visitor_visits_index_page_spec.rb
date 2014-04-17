require 'spec_helper'

describe User do
  it 'allows visitors to see the home page' do
    visit root_path
    page.should have_content 'User Index'
  end
end
