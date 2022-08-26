#!/bin/bash
export PROJECT_ID="urban-devops-test"
export SERVICE_ACCOUNT_NAME="dee-service-account"
export WORKLOAD_IDENTITY_POOL_NAME="dee-pool"
export WORKLOAD_IDENTITY_POOL_PROVIDER_NAME="dee-provider"
export REPO="lexicoder/urban-devops-take-home-test"

gcloud iam service-accounts create "$SERVICE_ACCOUNT_NAME" --project "${PROJECT_ID}"
gcloud services enable iamcredentials.googleapis.com --project "${PROJECT_ID}"
gcloud iam workload-identity-pools create "$WORKLOAD_IDENTITY_POOL_NAME" --project="${PROJECT_ID}" --location="global" --display-name="Demo pool"
gcloud iam workload-identity-pools describe "$WORKLOAD_IDENTITY_POOL_NAME" --project="${PROJECT_ID}" --location="global" --format="value(name)"

export WORKLOAD_IDENTITY_POOL_ID=$(gcloud iam workload-identity-pools describe "$WORKLOAD_IDENTITY_POOL_NAME" --project="${PROJECT_ID}" --location="global" --format="value(name)")

gcloud iam workload-identity-pools providers create-oidc "$WORKLOAD_IDENTITY_POOL_PROVIDER_NAME" --project="${PROJECT_ID}" --location="global" --workload-identity-pool="$WORKLOAD_IDENTITY_POOL_NAME" --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.repository=assertion.repository" --issuer-uri="https://token.actions.githubusercontent.com"
gcloud iam service-accounts add-iam-policy-binding "$SERVICE_ACCOUNT_NAME@${PROJECT_ID}.iam.gserviceaccount.com" --project="${PROJECT_ID}" --role="roles/iam.workloadIdentityUser" --member="principalSet://iam.googleapis.com/${WORKLOAD_IDENTITY_POOL_ID}/attribute.repository/${REPO}"
gcloud iam workload-identity-pools providers describe "$WORKLOAD_IDENTITY_POOL_PROVIDER_NAME" --project="${PROJECT_ID}" --location="global" --workload-identity-pool="$WORKLOAD_IDENTITY_POOL_NAME" --format="value(name)"

echo "WORKLOAD_IDENTITY_PROVIDER: $WORKLOAD_IDENTITY_POOL_ID"
echo "SERVICE_ACCOUNT: $SERVICE_ACCOUNT_NAME@${PROJECT_ID}.iam.gserviceaccount.com"
