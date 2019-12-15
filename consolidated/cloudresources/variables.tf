
variable "name" {
    description = "The name of the VPC beig created."
    type        = "string"
   default ="hellovpc"
}

variable "project" {
    description = "The project in which the resource belongs. If it is not provided, the provider project is used."
    type        = "string"
    default     = "p-02-08-19-gcp-lab-admin4"
}

variable "auto_create_subnetworks" {
    description = "If set to true, this network will be created in auto subnet mode, and Google will create a subnet for each region automatically. If set to false, a custom subnetted network will be created that can support google_compute_subnetwork resources."
    type        = "string"
    default     = "false"
}

variable "routing_mode" {
    description = "Sets the network-wide routing mode for Cloud Routers to use. Accepted values are GLOBAL or REGIONAL."
    type        = "string"
    default     = "GLOBAL"
}

variable "subnetworks" {
    description = "Define subnetwork detail for VPC"
    type        = "list"
    default     =  [
        {
            subnetname       = "subnetss-1"
            region           = "us-east1"
            cidr             = "192.168.0.0/24"
            #enable_flow_logs = "true"
            #private_ip_google_access = "false"
        },
   
        {
            subnetname       = "subnet-1"
            region  = "us-east4"
            cidr    = "192.168.13.0/24"
        }
]
}


variable "secondary_ranges" {
  type        = "map"
  description = "Secondary ranges that will be used in some of the subnets"
  default =  {

  us-east1 = [
      {
        range_name    = "us-east1-secondary-01"
        ip_cidr_range = "192.168.64.0/24"
      },
 {
        range_name    = "us-east1-secondary-01-02"
        ip_cidr_range = "192.168.65.0/24"
      },
    ]

  us-east4 = [
  {
        range_name    = "us-east4-ssecondary-01"
        ip_cidr_range = "192.168.74.0/24"
      },

   ]
 }
}





variable "module_dependency" {
  type        = "string"
  default     = ""
  description = "This is a dummy value to great module dependency. Output from another module can be passed down in order to enforce dependencies"
}



variable fw_name {
  description = "A unique name for the resource, required by GCE"
  default ="ssh"
}


variable protocol {
  description = "The name of the protocol to allow"
default ="tcp"
}

variable ports {
  description = "List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP"
  type        = "list"
default =["22"]
}

variable source_ranges {
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
  type        = "list"
default =["0.0.0.0/0"]
}

variable "names" {
  description = "Names of the buckets to create in module."
  type        = list(string)
  default = [""]
}
