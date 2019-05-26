class CharactersController < ApplicationController
  def index
    @character_power = CharacterPower.new
    @powers = Power.order(name: :asc)
    @characters = Character.order(name: :asc)
  end

  def search
    @character_power = CharacterPower.new
    @powers = Power.order(name: :asc)
    @characters = Character.order(name: :asc)
    respond_to do |format|
      format.html { redirect_to characters_path }
      format.js
    end
  end
end
