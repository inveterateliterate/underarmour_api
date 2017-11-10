module UnderarmourApi
  class ClientAuthorization < Authorization

    def endpoint
      'oauth2/uacf/access_token/'
    end

    def data
      {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: grant_type,
      }
      #  code
    end
  end
end
