class CharactersController < ApplicationController
  def index
    @characters = Character.order(name: :asc)
  end
end
