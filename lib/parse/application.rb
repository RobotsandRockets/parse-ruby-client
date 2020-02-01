module Parse
  class Application
    def self.config
      Parse.client.request(Parse::Protocol.config_uri).body['params']
    end
  end
end
