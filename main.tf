resource "aws_s3_bucket" "s3" {
  bucket = var.bucket
  tags = var.tags
  }
resource "aws_s3_bucket_versioning" "s31666" {
  count = var.versioning_enabled ? 1 : 0
  bucket =  var.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_logging" "s32" {
  count  = var.logging ? 1 : 0
  bucket = var.bucket
  target_bucket = "${aws_s3_bucket.s3.id}"
  target_prefix = "logs"
}
resource "aws_s3_bucket_public_access_block" "s3" {
bucket = aws_s3_bucket.s3.id
block_public_acls = true
block_public_policy = true
restrict_public_buckets = true
ignore_public_acls      = true
}

resource "aws_s3_bucket_acl" "s34" {
  bucket = aws_s3_bucket.s3.id
  acl    = "private"
}

resource "aws_s3_bucket_lifecycle_configuration" "s35" {
  count = var.lifecycle_enabled ? 1 : 0 
  bucket =  var.bucket
   rule {
        id = var.s3_id
   filter {
      prefix = var.s3_prefix
   }
   expiration {
      days = var.s3_expired_days
    }
  status = "Enabled"
  dynamic "transition" {
  for_each = var.enable_transition ? [1] : []
  content {
   days = var.s3_transition_days
   storage_class = var.s3_transtion_storage_class
  }
  }
}
}
resource "aws_s3_bucket_server_side_encryption_configuration" "s36" {
  bucket = var.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
