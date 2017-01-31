class PageController < WikipediaController

  def index
    @movie_id = 'Y5N-LuqBpPo'
    render 'page/index'
  end

  def list
    res = getContents('WBC')

    # デコード(テスト用)
    # str = JSON.load(res.body)
    # logger.debug(str)

    # print(res.body)
    # render :text => res.body
    render :text => res.body.to_s
  end

end
