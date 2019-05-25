class CharacterPowersController < ApplicationController

  def new
    @character = Character.find(params[:character_id])
    @character_power = CharacterPower.new
  end

  def create
    @character = Character.find(params[:character_id])
    @char_power = CharacterPower.new(char_power_params)
    @char_power.character = @character
    if @char_power.save
      redirect_to characters_path, query: @character.name
    else
      render :new
    end
  end

  private

  def char_power_params
    params.require(:character_power).permit(:power_id)
  end

end
