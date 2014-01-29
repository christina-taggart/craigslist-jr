def link_to_category(name)
	"<a href='\/categories/" + name + "'>" + name.gsub(/-/, " / ") + "</a>"
end

def link_to_post(post)
	"<a href='\/posts/" + post.id.to_s + "'>" + post.title + "</a>"
end

def link_to_edit_url(post)
	relative_link = "\/posts/#{post.id}/edit?key=" + post.edit_key
	"<a href='" + relative_link +  "'>" + "localhost:9292" + relative_link + "</a>"
end

def link_to_new_post_form(category)
	"<a href='\/posts/new?id=" + category.id.to_s + "'>" + "Create New Post" + "</a>"
end

def generate_coinbase_button(item)
	coinbase = Coinbase::Client.new(ENV['COINBASE_API_KEY'])
	btc_price = coinbase.buy_price(1).amount
	post_price_btc = item.price * 0.0001 / btc_price  # Artificially reducing the exchange rate to make it cheap for me to demonstrate
	options = { callback_url: "/callback", success_url: "/success", cancel_url: "/cancel", auto_redirect: true, }
	r = coinbase.create_button item.title, post_price_btc, item.title ,"custom code", options
	r.embed_html
end
