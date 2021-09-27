variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to run the instance in."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet within the given VPC to run the instance in."
}

variable "executor_queue_name" {
  type        = string
  description = "The queue from which the executor should dequeue jobs."
}

variable "executor_tag" {
  type        = string
  description = "A label tag to add to all the executors. Can be used for filtering out the right instances in stackdriver monitoring."
}

variable "metrics_environment_label" {
  type        = string
  description = "The value for environment by which to filter the custom metrics."
}

variable "sourcegraph_external_url" {
  type        = string
  description = "The externally accessible URL of the target Sourcegraph instance."
}

variable "sourcegraph_executor_proxy_username" {
  type        = string
  description = "The shared username used to authenticate requests to the internal executor proxy."
}

variable "sourcegraph_executor_proxy_password" {
  type        = string
  description = "The shared password used to authenticate requests to the internal executor proxy."
}

variable "executor_docker_registry_mirror" {
  type        = string
  default     = ""
  description = "A URL to a docker registry mirror to use (falling back to docker.io)."
}

variable "executor_maximum_runtime_per_job" {
  type        = string
  default     = "30m"
  description = "The maximum wall time that can be spent on a single job"
}

variable "executor_maximum_num_jobs" {
  type        = number
  default     = 1
  description = "The number of jobs to run concurrently per executor instance"
}

variable "executor_num_total_jobs" {
  type        = string
  default     = ""
  description = "The maximum number of jobs that will be dequeued by the worker"
}

variable "executor_max_active_time" {
  type        = string
  default     = ""
  description = "The maximum time that can be spent by the worker dequeueing records to be handled"
}

variable "executor_firecracker_num_cpus" {
  type        = number
  default     = 4
  description = "The number of CPUs to give to each firecracker VM"
}

variable "executor_firecracker_memory" {
  type        = string
  default     = "12GB"
  description = "The amount of memory to give to each firecracker VM"
}

variable "executor_firecracker_disk_space" {
  type        = string
  default     = "20GB"
  description = "The amount of disk space to give to each firecracker VM"
}

variable "machine_image" {
  type        = string
  description = "Executor node machine disk image to use for creating the boot volume."
}

variable "machine_type" {
  type        = string
  default     = "c5n.metal" // 4 vCPU, 15GB
  description = "Executor node machine type."
}

variable "boot_disk_size" {
  type        = number
  default     = 100 // 100GB
  description = "Executor node disk size in GB"
}

variable "preemptible_machines" {
  type        = bool
  default     = false
  description = "Whether to use preemptible machines instead of standard machines; usually way cheaper but might be terminated at any time"
}

variable "min_replicas" {
  type        = number
  default     = 1
  description = "The minimum number of executor instances to run in the autoscaling group."
}

variable "max_replicas" {
  type        = number
  default     = 1
  description = "The maximum number of executor instances to run in the autoscaling group."
}

variable "jobs_per_instance_scaling" {
  type        = number
  default     = 20
  description = "The amount of jobs a single instance should have in queue. Used for autoscaling."
}

variable "ssh_access_cidr_range" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR range from where SSH access to the EC2 instances is acceptable from."
}

variable "http_access_cidr_range" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR range from where HTTP access to the metrics endpoint is acceptable from."
}

variable "resource_prefix" {
  type        = string
  default     = ""
  description = "An optional prefix to add to all resources created."
}