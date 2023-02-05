module ApplicationHelper
  def default_meta_tags
    {
      site: '誰でもデザイン',
      title: 'Web系デザイン初学者向けの情報検索サービス',
      reverse: true,
      separator: '|',
      description: '「誰でもデザイン」は、Web系デザイン初学者向けの情報検索サービスです。学び方やジャンルごとに、自分に合った情報を見つけることができます。',
      charset: 'UTF-8',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      og: {
        site_name: '誰でもデザイン',
        title: 'Web系デザイン初学者向けの情報検索サービス',
        description: '「誰でもデザイン」は、Web系デザイン初学者向けの情報検索サービスです。学び方やジャンルごとに、自分に合った情報を見つけることができます。',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.jpg'),
        locale: 'ja_JP',
      },
    }
  end
end
