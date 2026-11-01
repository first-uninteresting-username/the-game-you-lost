# You are the ball

> "Balls" - Anonymous

A simple ponglike game, where you control the ball.

![Image of the game](https://user-cdn.hackclub-assets.com/01a19841-b570-745f-8201-6cc3c4e7f347/action-top.png)

## How to run

Go to the [itch.io page](<>) or:

1. Install [devenv](https://devenv.sh).
2. Clone the repo:

```bash
gh repo clone first-uninteresting-username/you-are-the-ball
```

3. Enter the repo and run devenv:

```bash
cd you-are-the-ball
devenv shell
```

4. Export to web and serve:

```bash
export-web
serve-web
```

The script will show you a URL to enter.

## How to play

Hit space to play, hold space for one second to finish.

Players move with W/S or Arrow Up/Arrow Down.
Player 1 uses W/S and Player 2 uses the arrow keys.

### Game basics

- The player whose paddle last touched the ball controls it.
- The ball accelerates, while the paddles move at a constant speed.
- The ball's Y velocity increases when it bounces off the walls.
- The ball's X velocity scales with its Y velocity.
- The ball loses half its velocity when hitting a paddle.
