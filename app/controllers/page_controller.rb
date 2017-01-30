class PageController < WikipediaController

  def list
    res = getContents('WBC')

    # デコード(テスト用)
    # str = JSON.load(res.body)
    # logger.debug(str)

    # print(res.body)
    # render :text => res.body
    returnResponse res.body
  end

end
