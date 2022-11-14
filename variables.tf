variable "versioning_enabled" {
  default = true
   description = " Bollean value indicating if versionig for objects within bucket needs to be enabled. Default is true."
}
variable "lifecycle_enabled" {
default = true
description = "Does this bucket needs any oject to either transtion to another low cost storage or needs object to be expired after some days"
}
variable "logging" {
  default     = true
  description = "Bucket access logging configuration is required for the created bucket. Since the log buckect needs to be created before actual bucket enabling this option created logs in same bucket with log prefix."
}
variable "env" {
type = string
default = "dev"
}
variable "tags" {
type = map
default = {
account = "dev"
owner = "jaffar"
}
}

variable "bucket" {
  default     = "bukkibucket88877778"
  description = "The name of the bucket to create. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
  type        = string
}
variable "s3_id" {
  default = "logs"
  type = string 
  description = "provide the ID , this can be any meanigful name for us to identify the liefcle policy applied to Bucket"
}
variable "s3_prefix" {
  default = "/"
  type = string 
  description = "this option enables to set the  rule to specific folder/object within the bucket. / indicates all the objects within the bucket"
}
variable "s3_expired_days" {
  default = null
  description = "indicates if the object within bucket needs to expire. default is null so the object never expires"
}
##  This option enables the bucket object to transition to another lowcost storage ##
variable "enable_transition" {
  default = true
  description = "(Optional) Information in regards to moving the data to low cost storage is required" 
}
variable "s3_transition_days"{
type = number 
default = 30 
description = "if the trasition is enabled . How long before it moves to low cost storage"
}
variable "s3_transtion_storage_class"{
type = string  
default = "GLACIER"
description = "if the transition is enabled . which storage it needs to move, possible options are IA_storage, Glacier"
}
variable "region" {
  default = "us-east-1"
}
