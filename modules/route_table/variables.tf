variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
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
