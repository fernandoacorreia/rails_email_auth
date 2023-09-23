module EmailAuth
  class GeneratesToken
    TOKEN_SHELF_LIFE_IN_MINUTES = 60

    def generate(user)
      user.update!(
        auth_token: SecureRandom.urlsafe_base64,
        auth_token_expires_at: TOKEN_SHELF_LIFE_IN_MINUTES.minutes.from_now
      )
      user.auth_token
    end
  end
end
