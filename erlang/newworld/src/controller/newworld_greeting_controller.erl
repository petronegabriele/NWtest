-module(newworld_greeting_controller,[Req]).
-compile(export_all).
header('GET', []) ->
	{ok, [{urlLogo, "http://static3.spilcdn.com/tw/cimg/logo/79,1259239515,logo.gif"},
	{description, "Your zone to play free online games"}]}.
newslist('GET',[]) ->
	{ok, [
	{newslist, [ 
		[
			{date, "1169090455"},
			{title, "Family Barn"},
			{body, "Be the master of moo in your own delicious dairy adventure!"},
			{img, "http://static1.spilcdn.com/tw/120X90/5/3/152653/20120215023652_Monster-Truck-Destroyer.png"}
		],
		[
			{date, "1169090455"},
			{title, "Family Barn"},
			{body, "Be the master of moo in your own delicious dairy adventure!"},
			{img, "http://static1.spilcdn.com/tw/120X90/5/3/152653/20120215023652_Monster-Truck-Destroyer.png"}
		]
		]
	},
	{pages, [ 
		[
			{num, "1"},
			{url, "/index.html"}
		],
		[
			{num, "2"},
			{url, "/index2.html"}
		]
		]
	}

	]
	}.
profile('GET', []) ->
	{ok, [{name, "Gabriele"},
	{birthday, "07-10-1981"},
	{city, "Rome"},
	{country, "Italy"},
	{gameName, "Pet Party"}]};
profile('POST', []) ->
	{ok, [{name, "GabrieleP"},
	{birthday, "07-10-1981"},
	{city, "Rome"},
	{country, "Italy"},
	{gameName, "Pet Party"}]}.

