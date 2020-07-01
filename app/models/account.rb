class Account < ApplicationRecord
  RESTRICTED_SUBDOMAINS = %w(www dev api test webmail engineering technology app apps blog imap pop webmail dav smtp domainkey admin dashboard help doc true false null nil)

  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false, message: 'taken' },
                        format: { with: /\A[\w\-]+\Z/i, message: 'invalid_characters' },
                        exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted' }
  
  before_validation :downcase_subdomain

  private
  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end
end
