require 'rails_helper'
RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'https://yamaha-motor.herokuapp.com',
          variables: {
            defaultHost: {
              default: 'https://yamaha-motor.herokuapp.com'
            }
          }
        }
      ],
      components: {
        securitySchemes: {
          Bearer: {
            type: :apiKey,
            in: :header,
            name: 'Authorization',
            description: 'Bearer token'
          }
        }
      }
    }
  }

  config.swagger_format = :yaml
end
