test_coffeescript
=================

So I was reading [Testing with coffeescript](https://efendibooks.com/minibooks/testing-with-coffeescript) and I thought to myself [~~What the fuck~~](http://www.youtube.com/watch?v=rsIgSusKrR8&feature=related), maybe I should write some code. So i did. 

I didn't enjoy the minibook, it's not well written and there are some typos, even in the code, and the code doesn't seem very idiomatic to me.  It's good enough if you've never used Jasmine before, but I was more interested on idiomatic Coffescript in a TDD environment.

To compile the Coffeescript into Javascript just paste this in a terminal outside the repo (I'm sure there's a better way for this, but I didn't want to waste time on this, I'm usually writing Coffescript in a Rails app, so I don't have to worry about compilation), I'm assuming you've already cloned the repo and have the Coffescript compiler,

```bash
coffee --compile --bare --output test_coffeescript/dist/ test_coffeescript/
```

and open ```SpecRunner.html``` in your favorite browser.