variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type    = string
  default = null
}

variable "subnet_id" {
  type = string
}

variable "env" {
  type = string

}

variable "tags" {
  type    = map(string)
  default = {}
}

# Allow switching between public and private route tables
variable "type" {
  type    = string
  default = "public"
}
