module ConnectHelper
  def movie(movie_id)
    iframe = content_tag(
        :iframe,
        '', # empty body
        width: 560,
        height: 315,
        src: "https://www.youtube.com/embed/#{movie_id}",
        frameborder: 0,
        allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
  end
end
