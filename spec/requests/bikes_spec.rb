require 'swagger_helper'

RSpec.describe 'bikes', type: :request do
  
  path '/bikes' do
    get('list bikes') do
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
    
    post('create bike') do
      response(200, 'successful') do
        consumes 'multipart/form-data'
        security [Bearer: {}] #added
        parameter name: :Authorization, in: :header, type: :string #added
        parameter name: :bike, in: :body, schema: {
          type: :object,
          properties: {
            make: { type: :string },
            description: { type: :string },
            price: { type: :number },
            image: { type: :file },
            model: { type: :string},
            is_available: {type: :boolean}
          },
          required: %w[make model price image is_available description],
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

  path '/bikes/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show bike') do
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

    delete('delete bike') do
      response(200, 'successful') do
        consumes 'application/json'
        security [Bearer: {}] #added
        parameter name: :Authorization, in: :header, type: :string #added
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
