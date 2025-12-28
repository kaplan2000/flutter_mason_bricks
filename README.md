# Flutter Mason Bricks

A collection of opinionated [Mason](https://github.com/felangel/mason) bricks for Flutter development.

## Bricks

| Brick                   | Description                                                       | Version |
| ----------------------- | ----------------------------------------------------------------- | ------- |
| [setup](./bricks/setup) | Initial Flutter project setup with MVVM, Riverpod, and AutoRoute. | 0.0.1   |

## Usage

To use these bricks, create or update your `mason.yaml` file in your Flutter project:

```yaml
bricks:
  setup:
    git:
      url: https://github.com/kaplan2000/flutter_mason_bricks
      path: bricks/setup
      # Use 'ref' to lock to a specific version (tag or commit)
      ref: v0.0.1
```

Then run:

```bash
mason get
mason make setup
```

## Usage & Contributions

This project is published primarily as a **reference implementation**.

Feel free to:

- Take inspiration from it
- Fork it and evolve it independently
- Customize it for your own needs

At the moment, I’m not planning to review or merge external pull requests or feature suggestions.
The direction of the project is intentionally opinionated and maintained according to my own workflow taste.
