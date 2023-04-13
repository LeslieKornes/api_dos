require 'rails_helper'

# this spec doesn't care about response, status, or format
# will only check if a route is _defined_
RSpec.describe '/articles routes' do
  it 'routes to articles#index' do
    aggregate_failures do 
      # expect(get '/articles').to route_to(controller: 'articles', action: 'index) (long-hand)
      expect(get '/articles').to route_to('articles#index')
      expect(get '/articles?page[number]=3').to route_to('articles#index', page: { 'number' => '3' })
    end
  end

  it 'routes to articles#show' do
    expect(get('/articles/1')).to route_to('articles#show', id: '1')
  end
end