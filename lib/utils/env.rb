module Utils

  class Env

    def self.production?
      return Rails.env == "production"
    end

    def self.develop?
      return !production?
    end

  end

end
