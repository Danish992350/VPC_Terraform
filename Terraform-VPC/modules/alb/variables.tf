variable "sg_id" {
    description  = "sg ID for application_load_balancer"
    type = string
}

variable "subnets" {
    description = "subnets for alb"
    typr = list(string  )
}

variable "vpc_id" {
    description = "vpc ID for alb"
    typr = string
}

