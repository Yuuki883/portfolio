module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'ヒストリアン'
    if page_title.blank?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end
  def default_meta_tags
    {
      site: 'portfolio',
      title: 'portfolioのトップページ',
      reverse: true,
      charset: 'utf-8',
      description: 'portfolioのトップページです',
      keywords: '歴史 武将 SNS',
      canonical: request.original_url,
      separator: '|',
    #   icon: [
    #     { href: image_url('favicon.ico') },
    #     { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
    #   ]
    }
   end
end
