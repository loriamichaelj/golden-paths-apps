# apps

Apps on golden paths, one folder each. Every app has a contract (`golden-path.yaml`), an OpenTofu root module in `infra/` that calls a path from `platform`, and its code in `src/`.

| App | Path | Cloud | Tier | Environments |
| --- | --- | --- | --- | --- |
| `golden` | single-api | AWS | silver | dev, stage, prod |
| `notifier` | event-driven | AWS | silver | dev, stage, prod |

Pipelines use the components from the `golden-paths-devops` repo.
