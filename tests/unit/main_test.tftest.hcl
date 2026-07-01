# Unit Tests for tf-atom-apigateway-base-path-mapping-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# Run with:      terraform test -test-directory=tests/unit
# Run verbose:   terraform test -test-directory=tests/unit -verbose
# Run specific:  terraform test -test-directory=tests/unit -run "creates_when_enabled"
#
# NOTE: Assertions target plan-KNOWN values (tf-label pass-throughs such as the
# `enabled` flag) rather than computed ids/arns, which are unknown under a mock
# provider and would error at plan time.

mock_provider "aws" {}

# Standard tf-label inputs shared by all runs.
variables {
  namespace = "eg"
  stage     = "test"
  name      = "thing"
}

# ---------------------------------------------------------------------------
# Test: module is active when enabled = true (the default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = output.enabled == true
    error_message = "Module should report enabled = true when the enabled input is true (default)."
  }
}

# ---------------------------------------------------------------------------
# Test: module is inert when enabled = false
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = output.enabled == false
    error_message = "Module should report enabled = false when the enabled input is false."
  }
}
