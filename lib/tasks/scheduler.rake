task :scrap do
  response = HTTParty.get('https://nozwideleccatering.pl/')
  site_content = response.body
  # soups_div_content = site_content.match(/<div class="content_block" id="custom_post_widget-34">((.|\n)*?)<\/div>/).captures.first
  # soup = soups_div_content.match(/<p((.|\n)*?)>((.|\n)*?)<\/p>/).captures.third.chop
  # p soup
  
  main_dishes_div_content = site_content.match(/<div class="content_block" id="custom_post_widget-24">((.|\n)*?)<\/div>/).captures.first
  main_dishes_paragraphs_content = main_dishes_div_content.scan(/<p(.|\n)*?>((.|\n)*?)<\/p>/)
  main_dishes = [
    main_dishes_paragraphs_content[0][1].chop,
    main_dishes_paragraphs_content[2][1].chop,
    main_dishes_paragraphs_content[4][1].chop
  ]

  p main_dishes

  payload = {
    username: 'Fork and Knife',
    channel: 'webhooks',
    attachments: [
      {
        pretext: "Nocne hakowanie",
        text: "Wybierz drugie danie",
        actions: [
          {
            id: "select_main_dish",
            name: "Select main dish",
            integration: {
              url: "https://zamawiajka.herokuapp.com/mattermost",
              context: {
                action: "do_something"
              }
            },
            type: "select",
            options: main_dishes.map { |dish| { text: dish, value: dish } }
          }
        ]
      }
    ]
  }

  result = HTTParty.post('https://chat.railwaymen.org/hooks/de1kf1fgqffgbct8ywmhas557y', {
    body: payload.to_json,
    headers: {
      'Content-Type': 'application/json'
    }
  })

  puts result

  # response2 = HTTParty.get('https://nozwideleccatering.pl/menu-obiady/')
  # site_content2 = response2.body
  # content = site_content2.scan(/<p style="font-size: 22px;(.|\n)*?>((.|\n)*?)<\/p>/)
  # products_and_prices = content.map { |element| element.second }
  # hashes = products_and_prices.each_slice(2).map do |element|
  #   { product: element.first, price: element.second }
  # end

  # p hashes
end