variable "sg_id" {
    description = "Sg ID for ec2"
    type = string
}

variable "subnets" {
    description = " subnets for ec2"
    type = list(string)
}

variables "ec2_names"{
    description = "ec3 names"
    type = list(string)
    default = ["webserver1", "webserver2"]
}