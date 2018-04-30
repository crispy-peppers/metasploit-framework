require 'swagger/blocks'

module SessionApiDoc
  include Swagger::Blocks

# Swagger documentation for sessions model
  swagger_schema :Session do
    key :required, [:id]
    property :id, type: :integer, format: :int32
    property :stype, type: :string
    property :via_exploit, type: :string
    property :via_payload, type: :string
    property :desc, type: :string
    property :port, type: :integer, format: :int32
    property :platform, type: :string
    property :opened_at, type: :string, format: :date_time
    property :closed_at, type: :string, format: :date_time
    property :closed_reason, type: :string
    property :local_id, type: :integer, format: :int32
    property :last_seen, type: :string, format: :date_time
    property :module_run_id, type: :integer, format: :int32
  end

  # Swagger documentation for /api/v1/sessions GET
  swagger_path '/api/v1/sessions' do
    operation :get do
      key :description, 'Return sessions that are stored in the database.'
      key :tags, [ 'session' ]

      parameter :workspace

      response 200 do
        key :description, 'Returns sessions data.'
        schema do
          key :type, :array
          items do
            key :'$ref', :Session
          end
        end
      end
    end

    # Swagger documentation for /api/v1/sessions POST
    operation :post do
      key :description, 'Create a sessions entry.'
      key :tags, [ 'session' ]

      parameter do
        key :in, :body
        key :name, :body
        key :description, 'The attributes to assign to the session.'
        key :required, true
        schema do
          key :'$ref', :Session
        end
      end

      response 200 do
        key :description, 'Successful operation.'
        schema do
          key :type, :object
          key :'$ref', :Session
        end
      end
    end
  end
end
