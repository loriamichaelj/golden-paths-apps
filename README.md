# apps

Apps holds the golden-path apps the platform runs for itself: `golden`, the Golden Path API, and `notifier`, the Slack notifier. Each app folder has a contract (`golden-path.yaml`), an OpenTofu root module under `infra/` that calls its path with per-environment settings, and the application code. Check any contract with `gold validate <app>/golden-path.yaml`, and pipelines take their jobs from the pipeline components repository.
