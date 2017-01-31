class WikipediaController < ConnectController

  API_URL = 'https://ja.wikipedia.org/w/api.php'

  def getContents(search_name)

    params = {
        :action => 'query',
        :list => 'search',
        :srsearch => search_name.to_s,
        :format => 'json'
    }

    res = getRequest(API_URL,params)
    return res

  end

end
