module HostGetter
    extend ActiveSupport::Concern

    def base_url
        "http://localhost:3000"
    end

    def get_attachment(attachment)
        if attachment.attached?
            base_url + Rails.application.routes.url_helpers.rails_blob_path(attachment, disposition: "attachment")
        else
            ""
        end
    end
end