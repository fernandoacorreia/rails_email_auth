# Orchestrates several tasks needed to send or generate an email with a magic link.
module EmailAuth
  class EmailsLink
    def initialize
      @finds_or_creates_user = FindsOrCreatesUser.new
      @generates_token = GeneratesToken.new
      @delivers_email = DeliversEmail.new
    end

    def email(email:, redirect_path:)
      return unless (user = @finds_or_creates_user.find_or_create(email))
      token = @generates_token.generate(user)
      @delivers_email.deliver(
        user: user,
        token: token,
        redirect_path: redirect_path
      )
    end
  end
end
