class CharactersController < ApplicationController
  def index
    if params[:query].blank?
      @characters = Character.order(name: :asc)
    else
      @characters = Character.where('name ILIKE ?', "%#{params[:query]}%").order(name: :asc)
    end
    @character_power = CharacterPower.new
  end

  def search
    @character_power = CharacterPower.new
    if params[:query].blank?
      @characters = Character.order(name: :asc)
    else
      @characters = Character.where('name ILIKE ?', "%#{params[:query]}%").order(name: :asc)
    end
    respond_to do |format|
      format.html { redirect_to characters_path }
      format.js
    end
  end
end
