# Flutter Mason Bricks

A collection of opinionated [Mason](https://github.com/felangel/mason) bricks for Flutter development.

## Bricks

| Brick                       | Description                                                            | Version |
| --------------------------- | ---------------------------------------------------------------------- | ------- |
| [setup](./bricks/setup)     | Initial Flutter project setup with MVVM, Riverpod, and AutoRoute.      | 0.1.4   |
| [feature](./bricks/feature) | Creates a new feature folder with base clean architecture structure.   | 0.1.4   |
| [page](./bricks/page)       | Creates a new page and its ViewModel/state inside an existing feature. | 0.1.4   |
| [flow](./bricks/flow)       | Creates a full data flow skeleton (domain → data) for a feature.       | 0.1.4   |

## Usage

To use these bricks, create or update your `mason.yaml` file in your Flutter project:

```yaml
bricks:
  setup:
    git:
      url: https://github.com/kaplan2000/flutter_mason_bricks
      path: bricks/setup
      ref: v0.1.4
  feature:
    git:
      url: https://github.com/kaplan2000/flutter_mason_bricks
      path: bricks/feature
      ref: v0.1.4
  page:
    git:
      url: https://github.com/kaplan2000/flutter_mason_bricks
      path: bricks/page
      ref: v0.1.4
  flow:
    git:
      url: https://github.com/kaplan2000/flutter_mason_bricks
      path: bricks/flow
      ref: v0.1.4
```

Then run:

```bash
mason get

# To setup a new project
mason make setup

# To create a new feature
mason make feature --feature_name my_feature

# To create a new page in a feature
mason make page --feature_name my_feature --page_name my_page

# To create a new data flow (domain + data)
mason make flow --feature_name my_feature --flow_name my_flow --has_remote true --has_mock false
```

## Usage & Contributions

This project is published primarily as a **reference implementation**.

Feel free to:

- Take inspiration from it
- Fork it and evolve it independently
- Customize it for your own needs

At the moment, I’m not planning to review or merge external pull requests or feature suggestions.
The direction of the project is intentionally opinionated and maintained according to my own workflow taste.
