require 'rails_helper'

RSpec.describe Article, type: :model do
  # #validations bc testing on the class level
  describe '#validations' do
    let(:article) { build(:article) }
    

    it 'tests that factory is valid' do
      # create saves obj to db. often we don't need all that
      # article = create(:article)
      expect(article).to be_valid
    end
  
    it 'validates presence of title' do
      article.title = ''
      expect(article).not_to be_valid
    end

    it 'validates presence of content' do
      article.content = ''
      expect(article).not_to be_valid
    end

    it 'validates presence of slug' do
      article.slug = ''
      expect(article).not_to be_valid
    end

    it 'validates the uniqueness of the slug' do
      article1 = create(:article)
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
    end
  end
  
end
