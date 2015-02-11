module FbGraph2
  class App < Node
    include Edge::Achievements
    include Edge::AppLinkHosts
    include Edge::AppEventTypes
    include Edge::Banned
    include Edge::Groups
    include Edge::Permissions
    include Edge::Picture
    include Edge::Roles::AppContext
    include Edge::Scores
    include Edge::StaticResources
    include Edge::Subscriptions
    include Edge::TestUsers
    include Edge::Translations

    register_attributes(
      raw: [
        :android_key_hash, :app_domains, :auth_dialog_data_help_url, :auth_dialog_headline,
        :auth_dialog_perms_explanation, :auth_referral_enabled, :auth_referral_extended_perms,
        :auth_referral_friend_perms, :auth_referral_user_perms, :canvas_fluid_height, :canvas_fluid_width,
        :canvas_url, :category, :company, :contact_email, :creator_uid, :daily_active_users, :daily_active_users_rank,
        :deauth_callback_url, :description, :hosting_url, :icon_url, :ios_bundle_id, :iphone_app_store_id,
        :link, :logo_url, :mobile_web_url, :monthly_active_users, :monthly_active_users_rank, :name,
        :namespace, :page_tab_default_name, :page_tab_url, :privacy_policy_url, :secure_canvas_url,
        :secure_page_tab_url, :server_ip_whitelist, :social_discovery, :subcategory, :terms_of_service_url,
        :user_support_email, :user_support_url, :website_url, :weekly_active_users
      ],
      timestamp: [:created_time],
      custom: [
        :auth_referral_default_activity_privacy, :auth_referral_response_type, :context, :migrations,
        :object_store_urls, :restrictions
      ]
    )

    def initialize(id, attributes = {})
      super
      # TODO: handle custom attributes.
    end

    def self.app(access_token)
      new(:app).authenticate access_token
    end
  end
end