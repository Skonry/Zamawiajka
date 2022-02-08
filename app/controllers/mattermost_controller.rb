class MattermostController < ApplicationController
  def order
    puts params.inspect

    render json: { ephemeral_text: "Wybrano" }
  end
end