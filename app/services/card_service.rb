class CardService
  def initialize(user_id, card)
    @user = User.find(user_id)
    @card = card
  end
end