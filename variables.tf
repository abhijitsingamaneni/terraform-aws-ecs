// task variables
variable "container_cpu" {
    default     = "256"
    description = "container cpu in MB"
}
variable "container_memory" {
    default     = "512"
    description = "container memory in MB"
}
variable "service_file" {
    description = "container configuration file"
}

// env variables
variable "env" {
    description = "name of the enviroment (example: prod, dev)"
}
variable "application" {
    description = "name of the application that we are deploying for (example: apiserver or chatserver or doctor-web)"
}