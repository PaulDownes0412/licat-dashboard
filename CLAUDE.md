# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Running the App

Open `tictactoe.html` directly in a browser. There is no build step or server required.

On Windows:
```
start tictactoe.html
```

## Architecture

Single self-contained file: `tictactoe.html`

- **HTML** — game board grid, score display, status messages, reset button
- **CSS** — inline styles for layout, cell appearance, and win highlighting
- **JavaScript** — inline game logic

### Key JS constructs

| Name | Purpose |
|------|---------|
| `board` | Array[9] tracking cell state (`null`, `'X'`, or `'O'`) |
| `current` | Whose turn it is (`'X'` or `'O'`) |
| `gameOver` | Boolean flag preventing moves after win/draw |
| `WINS` | Constant array of 8 winning index combinations used for win detection |
| `score` | Object `{ X: 0, O: 0 }` tracking wins across rounds (in-memory) |

## Notes

- No build system, package manager, or dependencies
- No test framework or linter configured
- Changes to game logic and styles are made directly in `tictactoe.html`
