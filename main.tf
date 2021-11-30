####################################################################################
# PUSH-API supporting infrastructure trigger
####################################################################################

# PLAN

resource "google_cloudbuild_trigger" "tst-push-api_supporting_infra_plan" {
  provider = google-beta
  name = "Plan-dcsgva-push-api-tst"

  github {
    owner = "gva-nhamad"
    name = "dcsgva-push-api"
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
    owner = "gva-nhamad"
    name = "dcsgva-push-api"
    push {
      branch = "main"
    }
  }

  description    = "APPLY: automated trigger for creating the push api supporting infra"
  filename       = "pipeline/ci/cloudbuild-apply.yaml"
  disabled       = false
}




####################################################################################
# LEGBA trigger
####################################################################################

# PLAN

resource "google_cloudbuild_trigger" "legba_plan" {
  provider = google-beta
  name = "Plan-dcsgva-legba-tst"

  github {
    owner = "gva-nhamad"
    name = "api-receiver-legba"
    pull_request {
      branch = "^main$"
    }
  }

  description    = "PLAN: automated trigger for creating the push api supporting infra"
  filename       = "cloudbuild.yaml"
  disabled       = false
}

# APPLY

resource "google_cloudbuild_trigger" "legba_infra_apply" {
  provider = google-beta
  name = "Apply-dcsgva-legba-tst"

  github {
    owner = "gva-nhamad"
    name = "api-receiver-legba"
    push {
      branch = "main"
    }
  }

  description    = "APPLY: automated trigger for creating the push api supporting infra"
  filename       = "cloudbuild.yaml"
  disabled       = false
}