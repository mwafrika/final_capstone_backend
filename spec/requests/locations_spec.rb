require 'swagger_helper'

RSpec.describe 'locations', type: :request do
  path '/locations' do
    get('list locations') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create location') do
      response(200, 'successful') do
        consumes 'application/json'
        security [Bearer: {}] # added
        parameter name: :Authorization, in: :header, type: :string # added

        parameter name: :location, in: :body, schema: {
          type: :object,
          properties: {
            full_address: { type: :string }
          }
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/locations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show location') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete location') do
      response(200, 'successful') do
        consumes 'application/json'
        security [Bearer: {}] # added
        parameter name: :Authorization, in: :header, type: :string # added
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
