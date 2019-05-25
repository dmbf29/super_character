class CharactersController < ApplicationController
  def index
    @character = Character.all
  end
end
