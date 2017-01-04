class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token

  def query
    # Execute queries with your schema
    result = Schema.execute(params[:query], variables: params[:variables])
    render json: result
  end
end
