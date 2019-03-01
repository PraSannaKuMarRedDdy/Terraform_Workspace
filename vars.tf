variable "AWS_ACCESS_KEY" {
	default = "Access_key"
}
variable "AWS_SECRET_KEY" {
	default = "Secret_Access_key"
}
variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykeypair"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykeypair.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    ap-south-1 = "ami-0937dcc711d38ef3f"
  }
}
