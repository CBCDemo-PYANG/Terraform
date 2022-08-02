resource "google_storage_bucket_iam_binding" "publiclyAccessibleBucket" {
  bucket   = google_storage_bucket.testStorageBucket1.name
  role     = "roles/storage.admin"
  members = [
    "user:jane@example.com",
    "allUsers"
  ]
}


resource "google_storage_bucket_iam_member" "storageBucketMemberAccess" {
  bucket = google_storage_bucket.testStorageBucket2.name
  role   = "roles/storage.admin"
  member = "allUsers"
}