module SteamAvatarHelper
  require 'nokogiri'
  require 'open-uri'

  def steam_avatar_url(profile_url)
    # Normalize URL (in case user passes just username or missing https)
    unless profile_url.start_with?('http')
      profile_url = "https://steamcommunity.com/id/#{profile_url}/"
    end

    # Use Rails cache to avoid fetching from Steam every page load
    Rails.cache.fetch("steam_avatar_#{profile_url}", expires_in: 12.hours) do
      begin
        doc = Nokogiri::HTML(URI.open(profile_url))
        img = doc.at_css('.playerAvatarAutoSizeInner img')
        img ? img['src'] : nil
      rescue => e
        Rails.logger.error("Failed to scrape Steam avatar: #{e.message}")
        nil
      end
    end
  end
end
