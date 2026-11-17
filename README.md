# BunnyMark - Gosu

A Ruby port of the classic [BunnyMark](https://github.com/zenorocha/bunnymark) sprite benchmark,
built with [Gosu](https://www.libgosu.org/), plus a [DragonRuby](https://dragonruby.org/) variant
for comparison.

The benchmark starts with a screen full of bunnies that bounce around, and then adds or removes
bunnies every frame to hold the frame rate at 60 FPS. The number of bunnies on screen is therefore
a rough measure of how many sprites the renderer can push at that frame rate.

## Files

| File | Description |
| --- | --- |
| `bunnymark.rb` | The Gosu implementation (the main app). |
| `dragonruby.rb` | The DragonRuby implementation, meant to be dropped into a DragonRuby GTK project as `app/main.rb`. |
| `gosu.rb` | Gosu API reference stub, useful for editor completion and documentation lookup. Not part of the game. |
| `resources/raybunny.png` | The bunny sprite used by the Gosu version. |

## Requirements

- Ruby
- The `gosu` gem, which needs the usual native build dependencies for your platform
  (SDL2, OpenGL headers, a C++ compiler):

  ```sh
  gem install gosu
  ```

For the DragonRuby version you need a copy of the
[DragonRuby GTK](https://dragonruby.org/toolkit/game) runtime instead.

## Running

Gosu version, from this directory (the sprite path is resolved relative to the working directory):

```sh
ruby bunnymark.rb
```

DragonRuby version:

```sh
cp dragonruby.rb <dragonruby-project>/app/main.rb
<dragonruby-project>/dragonruby
```

## Controls

| Input | Action |
| --- | --- |
| Left mouse button | Spawn 1,000 bunnies at the cursor (Gosu version). |
| `ESC` | Quit (Gosu version). |
| `~` | Open the DragonRuby console; run `reset_with count: 5000` to restart with a different bunny count (DragonRuby version). |

Both versions display the current bunny count and FPS in the top-left corner.
