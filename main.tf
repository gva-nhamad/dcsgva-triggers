####################################################################################
# PUSH-API supporting infrastructure trigger
####################################################################################

# PLAN

resource "google_cloudbuild_trigger" "tst-push-api_supporting_infra_plan" {
  provider = google-beta
  name = "Plan-dcsgva-push-api-tst"

  github {
    owner = "lbg-gcp-custom"
    name = "${var.org_name}-push-api"
    pull_request {
      branch = "^main$"
    }
  }

  description    = "PLAN: automated trigger for creating the push api supporting infra"
  filename       = "pipeline/ci/cloudbuild-plan.yaml"
  disabled       = false
}

# APPLY

resource "google_cloudbuild_trigger" "tst-push-api_supporting_infra_apply" {
  provider = google-beta
  name = "Apply-dcsgva-push-api-tst"

  github {
    owner = "lbg-gcp-custom"
    name = "${var.org_name}-push-api"
    push {
      branch = "main"
    }
  }

  description    = "APPLY: automated trigger for creating the push api supporting infra"
  filename       = "pipeline/ci/cloudbuild-apply.yaml"
  disabled       = false
}