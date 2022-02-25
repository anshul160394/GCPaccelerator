// "cloud-storage" Module Variables

variable "cloud-storage-create" {
  type = bool
  default = false
}

variable "cloud-storage-count" {
  type = number
  default = 1
}

variable "names" {
  type    = list(string)
  default = ["yash-cs"]
}

variable "prefix" {
  type    = string
  default = "yash-prefix"
}

variable "project_id" {
  type    = string
  default = "yash-innovation"
}

//"pub-sub" module variables

variable "pub-sub-create" {
  type = bool
  default = false
}

variable "pub-sub-count" {
  type = number
  default = 1
}

variable "topic" {
  type    = string
  default = "tf-pub-sub-topic"
}

// "memorystore" redis module variables

variable "memorystore-create" {
  type = bool
  default = false
}

variable "memorystore-count" {
  type = number
  default = 1
}

variable "redis_version" {
  type = string
  default = "REDIS_5_0"
}

variable "redis_region" {
  type = string
  default = "us-central1"
}

variable "redis_name" {
  type = string
  default = "tf-memorystore-redis"
}

variable "redis_display_name" {
  type = string
  default = "tf-memorystore-redis"
}

variable "redis_location_id" {
  type = string
  default = "us-central1-a"
}

variable "memorystore_redis_size_GB" {
  type = number
  default = 1
}

variable "redis_tier" {
  type = string
  default = "BASIC"
}

// "kms" module variables

variable "kms-create" {
  type = bool
  default = false
}

variable "kms-count" {
  type = number
  default = 1
}

variable "kms_keyring" {
  type = string
  default = "tf-kms-keyring-1"
}

variable "kms_location" {
  type = string
  default = "global"
}

variable "kms_keys" {
  type = list(string)
  default = ["tf-kms-key"]
}

variable "kms_prevent_destroy" {
  type = bool
  default = false
}

// "network_vpc" module variables

variable "vpc-create" {
  type = bool
  default = false
}

variable "vpc-count" {
  type = number
  default = 1
}

variable "vpc_name" {
  type = string
  default = "tf-vpc"
}

//"network_subnets" module variables

variable "subnets-create" {
  type = bool
  default = false
}

variable "subnets-count" {
  type = number
  default = 1
}

variable "subnet_1_name" {
  type = string
  default = "subnet-01"
}

variable "subnet_1_ip_range" {
  type = string
  default = "10.10.10.0/24"
}

variable "subnet_1_region" {
  type = string
  default = "us-central1"
}

variable "subnet_1_private_access" {
  type = bool
  default = true
}

variable "subnet_1_flow_logs" {
  type = bool
  default = true
}

variable "subnet_1_description" {
  type = string
  default = "This is description for Subnet 1"
}

variable "subnet_2_name" {
  type = string
  default = "subnet-02"
}

variable "subnet_2_ip_range" {
  type = string
  default = "10.10.20.0/24"
}

variable "subnet_2_region" {
  type = string
  default = "us-central1"
}

variable "subnet_2_private_access" {
  type = bool
  default = true
}

variable "subnet_2_flow_logs" {
  type = bool
  default = true
}

variable "subnet_2_description" {
  type = string
  default = "This is description for Subnet 2"
}

// "network_fabric-net-firewall" module variables

variable "firewall-create" {
  type = bool
  default = false
}

variable "firewall-count" {
  type = number
  default = 1
}

variable "internal_ranges_enabled" {
  type = bool
  default = true
}

variable "internal_range" {
  type = string
  default = "10.10.0.0/16"
}

variable "internal_target_tag" {
  type = string
  default = "internal"
}

variable "http_source_range" {
  type = string
  default = "0.0.0.0/0"
}

variable "http_target_tag" {
  type = string
  default = "http-tag"
}

variable "https_source_range" {
  type = string
  default = "0.0.0.0/0"
}

variable "https_target_tag" {
  type = string
  default = "https-tag"
}

variable "ssh_source_range" {
  type = string
  default = "27.5.41.223/32"
}

variable "ssh_target_tag" {
  type = string
  default = "ssh-tag"
}

variable "ingress-rule_description" {
  type = string
  default = "ingress rule, tag-based for port 8080,9090,8000"
}

variable "ingress-rule_direction" {
  type = string
  default = "INGRESS"
}

variable "ingress-rule_action" {
  type = string
  default = "allow"
}

variable "ingress-rule_range" {
  type = string
  default = "27.5.41.223/32"
}

variable "ingress-rule_target" {
  type = string
  default = "custom-tag"
}

variable "ingress-rule_use_service_accounts" {
  type = bool
  default = false
}

variable "ingress-rule_rules_protocol" {
  type = string
  default = "tcp"
}

variable "ingress-rule_rules_port_8080" {
  type = number
  default = 8080
}

variable "ingress-rule_rules_port_9090" {
  type = number
  default = 9090
}

variable "ingress-rule_rules_port_8000" {
  type = number
  default = 8000
}

//"vm_instance_template" module variables

variable "vm_instance_template-create" {
  type = bool
  default = false
}

variable "vm_instance_template-count" {
  type = number
  default = 1
}

variable "vm_instance_template_region" {
  type = string
  default = "us-central1"
}

variable "service_account_email" {
  type = string
  default = "318439475831-compute@developer.gserviceaccount.com"
}

variable "service_account_scope_1" {
  type = string
  default = "https://www.googleapis.com/auth/compute"
}

variable "vm_instance_template_disk_size_gb" {
  type = string
  default = "10"
}

variable "vm_instance_template_machine_type" {
  type = string
  default = "g1-small"
}

 # image family includes rhel-6,rhel-7,debian-9,windows-1809-core etc.
variable "vm_instance_template_source_image_family" {
  type = string
  default = "ubuntu-1804-lts"
}

#available image project and family can be derived from following gcloud command i.e. gcloud compute images list 
variable "vm_instance_template_source_image_project" {
  type = string
  default = "ubuntu-os-cloud"
}

variable "vm_instance_template_network" {
  type = string
  default = "default"
}

variable "vm_instance_template_name_prefix" {
  type = string
  default = "tf-compute-template"
} 

//"vm_compute_instance" module variables

variable "vm_compute_instance-count" {
  type    = number
  default = 1
}

variable "vm_compute_instance-create" {
  type    = bool
  default = false
}
variable "vm_compute_instance_region" {
  type    = string
  default = "us-central1"
}

variable "vm_compute_instance_network" {
  type    = string
  default = "default"
}

variable "vm_compute_instance_hostname" {
  type    = string
  default = "tf-compute-engine"
}

variable "vm_compute_instance_access_config_network_tier" {
  type    = string
  default = "PREMIUM"
}

// module "iam_member_iam" variables

variable "iam_member_iam-create" {
  type = bool
  default = false
}

variable "iam_member_iam-count" {
  type = number
  default = 1
}

variable "iam_member_iam_service_account_address" {
  type = string
  default = "terraformsid@yash-innovation.iam.gserviceaccount.com"
}

variable "iam_member_iam_project_role_1" {
  type = string
  default = "roles/compute.networkAdmin"
}

variable "iam_member_iam_project_role_2" {
  type = string
  default = "roles/appengine.appAdmin"
}

// module "iam_custom_role_iam" variables

variable "iam_custom_role_iam-create" {
  type = bool
  default = false
}

variable "iam_custom_role_iam-count" {
  type = number
  default = 1
}


variable "iam_custom_role_iam_target_level" {
  type = string
  default = "project"
}

variable "iam_custom_role_iam_target_id" {
  type = string
  default = "tf_custom_role01"
}

variable "iam_custom_role_title" {
  type = string
  default = "Terraform Custom Role"
}

variable "iam_custom_role_description" {
  type = string
  default = "Terraform Role"
}

variable "iam_custom_role_permission_1" {
  type = string
  default = "iam.roles.list"
}

variable "iam_custom_role_permission_2" {
  type = string
  default = "iam.roles.create"
}

variable "iam_custom_role_permission_3" {
  type = string
  default = "iam.roles.delete"
}

variable "iam_custom_role_member_1" {
  type = string
  default = "serviceAccount:terraformsid@yash-innovation.iam.gserviceaccount.com"
}

// module "app_engine_standard_app_version" variables

variable "app_engine_standard_app_version-create" {
  type = bool
  default = false
}

variable "app_engine_standard_app_version-count" {
  type = number
  default = 1
}

variable "version_id" {
  type    = string
  default = "v1"
}

variable "service" {
  type    = string
  default = "pythonapp"
}

variable "runtime" {
  type    = string
  default = "python37"
}

variable "shell" {
  type    = string
  default = "python ./main.py"
}

variable "max_instances" {
  type    = number
  default = 1
}

variable "noop_on_destroy" {
  type    = bool
  default = true
}

variable "bucket_name" {
  type    = string
  default = "appengine-static-content-yashinnovation"
}

variable "bucket_object_name" {
  type    = string
  default = "hello-world.zip"
}

variable "zip_path" {
  type    = string
  default = "sample_files/python_hello_world.zip"
}

// modules "cloud_sql"

variable "cloud_sql-create" {
  type    = bool
  default = false
}

variable "cloud_sql-count" {
  type    = number
  default = 1
}

variable "db_instance_name" {
 type    = string
 default = "tf-database-2"
}

variable "sql_whitelist_ip_range" {
 type    = string
 default = "123.136.251.95/32"
}

variable "database_version" {
 type    = string
 default = "MYSQL_5_7"
}

variable "sql_deletion_protection" {
 type    = bool
 default = false
}

variable "sql_region" {
 type    = string
 default = "us-central1"
}

variable "sql_tier" {
 type    = string
 default = "db-f1-micro"
}

variable "sql_disk_size" {
 type    = number
 default = 10
}

variable "sql_username" {
 type    = string
 default = "root"
}

variable "sql_password" {
 type    = string
 default = "Yash1234"
}

variable "sql_host" {
 type    = string
 default = "%"
}

//module "google_memcache_instance" variables

variable "google_memcache_instance-create" {
  type    = bool
  default = false
}

variable "google_memcache_instance-count" {
  type    = number
  default = 1
}
variable "google_memcache_instance_name" {
	type = string
	default = "tf-memcache-instance"
}

variable "google_memcache_instance_region" {
	type = string
	default = "us-central1"
}

variable "google_memcache_instance_cpu_count" {
	type = number
	default = 1
}

variable "google_memcache_instance_memory_size_mb" {
	type = number
	default = 1024
}

variable "google_memcache_instance_node_count" {
	type = number
	default = 1
}

variable "memcache_global_address_name" {
	type = string
	default = "tf-global-address"
}

variable "memcache_global_address_purpose" {
	type = string
	default = "VPC_PEERING"
}

variable "memcache_global_address_type" {
	type = string
	default = "INTERNAL"
}

variable "memcache_global_prefix_length" {
	type = number
	default = 16
}

variable "memcache_network" {
	type = string
	default = "tf-memcache-network"
}

//module "google_container_registry" variables

variable "container_registry-create" {
  type    = bool
  default = false
}

variable "container_registry-count" {
  type    = number
  default = 1
}
variable "registry_region" {
	type = string
	default = "ASIA"
}

// module "cloud scheduler" variables

variable "scheduler_job-create" {
  type    = bool
  default = false
}

variable "scheduler_job-count" {
  type    = number
  default = 1
}

variable "scheduler_job_name" {
   type    = string
   default = "tf-scheduler-job"
} 

variable "scheduler_job_description" {
   type    = string
   default = "tf-scheduler-job"
}

variable "scheduler_job_schedule" {
   type    = string
   default = "*/2 * * * *"
}

variable "scheduler_job_time_zone" {
   type    = string
   default = "Asia/Kolkata"
}

//full name of existing pub/sub topic
variable "scheduler_job_topic_name" {
   type    = string
   default = "projects/yash-innovation/topics/yash-innovation-topic"
}

variable "scheduler_job_data" {
   type    = string
   default = "terrafrom dummy data to pub/sub"
}

// module "cloud_dns" variables

variable "cloud_dns-create" {
  type    = bool
  default = false
}

variable "cloud_dns-count" {
  type    = number
  default = 1
}

variable "record_type" {
 type    = string
 default = "A"
}

variable "ttl" {
 type    = number
 default = 300
}

variable "dns" {
 type    = string
 default = "tfyash.com."
}

variable "dns_name" {
 type    = string
 default = "yash-terraform"
}

variable "rrdatas" {
 type    = list(string)
 default = [ "8.8.8.8" ]
}

variable "a_record" {
 type    = string
 default = "backend.tfyash.com."
}

//module "artifact_registry" variable

variable "artifact_registry-create" {
  type    = bool
  default = false
}

variable "artifact_registry-count" {
  type    = number
  default = 1
}

variable "artifact_location" {
  type    = string
  default = "us-central1"
}

variable "artifact_repository_id" {
  type    = string
  default = "tf-repository"
}

variable "artifact_registry_description" {
  type    = string
  default = "Artifact repository created using terraform"
}

variable "artifact_format" {
  type    = string
  default = "DOCKER"
}

// module "billing_budget" variables

variable "billing_budget-create" {
 type = bool
 default = false
}

variable "billing_budget-count" {
 type = number
 default = 1
}

variable "billing_budget_billing_account" {
 type = string
 default = "0133E7-48985D-0BA2C9"
}

variable "billing_budget_display_name" {
 type = string
 default = "TF Billing Budget"
}

variable "billing_budget_currency_code" {
 type = string
 default = "USD"
}

variable "billing_budget_units" {
 type = string
 default = "300"
}

variable "billing_budget_threshold_percent" {
 type = number
 default = 0.8
}

// module "cloud_function" variable

variable "cloud_function-create" {
 type = bool
 default = false
}

variable "cloud_function-count" {
 type = number
 default = 1
}

variable "archive_name" {
  type = string
  default = "function_python_hello_world.zip"
}

variable "archive_bucket" {
  type = string
  default = "cloud-function-yash-bucket"
}

variable "archive_path" {
  type = string
  default = "sample_files/function_python_hello_world.zip"
}

variable "function_name" {
  type = string
  default = "TF-Function"
}

variable "function_description" {
  type = string
  default = "cloud function"
}

variable "function_runtime" {
  type = string
  default = "python37"
}

variable "function_memory_mb" {
  type = number
  default = 128
}

variable "function_trigger_http" {
  type = bool
  default = true
}

variable "function_entry_point" {
  type = string 
  default = "hello_world"
}

variable "function_role" {
  type = string 
  default = "roles/cloudfunctions.invoker"
}

variable "function_member" {
  type = string 
  default = "allUsers"
}

//  module "deployment_manager" variables

variable "deployment_manager-create" {
	type = bool
	default = false
}

variable "deployment_manager-count" {
	type = number
	default = 1
}

variable "deployment_name" {
	type = string
	default = "single-vm"
}

variable "yaml_path" {
	type = string
	default = "sample_files/deployment_manager_jinja/vm.yaml"
}

variable "import_name" {
	type = string
	default = "vm_template.jinja"
}

variable "import_path" {
	type = string
	default = "sample_files/deployment_manager_jinja/vm_template.jinja"
}

variable "label_key" {
	type = string
	default = "owner"
}

variable "label_value" {
	type = string
	default = "siddharth"
}

// module "cloud_run" variables

variable "cloud_run-create" {
	type = bool
	default = false
}

variable "cloud_run-count" {
	type = number
	default = 1
}

variable "cloud_run_service_name" {
	type = string
	default = "cloud-run-service"
}

variable "cloud_run_location" {
	type = string
	default = "us-central1"
}

variable "cloud_run_image" {
	type = string
	default = "gcr.io/cloudrun/hello"
}

variable "cloud_run_traffic_percent" {
	type = number
	default = 100
}

variable "cloud_run_latest_revision" {
	type = bool
	default = true
}

variable "cloud_run_role" {
	type = string
	default = "roles/run.invoker"
}

variable "cloud_run_member" {
	type = string
	default = "allUsers"
}

// modules "source_repositories" variables

variable "source_repositories-create" {
	type = bool
	default = false
}

variable "source_repositories-count" {
	type = number
	default = 1
}

variable "repository_name" {
	type = string
	default = "yash-source-repository"
}

variable "repository_role" {
	type = string
	default = "roles/editor"
}

variable "repository_members" {
	type = list(string)
	default = [ "user:siddharth.mishra@yash.com" ]
}

// module "cloud_spanner" variables

variable "cloud_spanner-create" {
	type = bool
	default = false
}

variable "cloud_spanner-count" {
	type = number
	default = 1
}

variable "spanner_region_config" {
	type = string
	default = "regional-us-central1"
}

variable "spanner_instance_name" {
	type = string
	default = "Yash-TF-Spanner"
}

variable "spanner_num_nodes" {
	type = number
	default = 1
}

variable "spanner_deletion_protection" {
	type = bool
	default = false
}

variable "spanner_database_name" {
	type = string
	default = "tf-database"
}

variable "spanner_role" {
	type = string
	default = "roles/editor"
}

variable "spanner_members" {
	type = list(string)
	default = [ "user:siddharth.mishra@yash.com" ]
}

// module "secret_manager" variables

variable "secret_manager-create" {
	type = bool
	default = false
}

variable "secret_manager-count" {
	type = number
	default = 1
}

variable "secret_id" {
	type = string
	default = "secret"
}

variable "secret_region" {
	type = string
	default = "us-central1"
}

variable "secret_data" {
	type = string
	default = "secret-data"
}

variable "secret_manager_role" {
	type = string
	default = "roles/secretmanager.secretAccessor"
}

variable "secret_manager_members" {
	type = list(string)
	default = [ "user:siddharth.mishra@yash.com" ]
}

// module "web_security_scanner" variables

variable "web_security_scanner-create" {
	type = bool
	default = false
}

variable "web_security_scanner-count" {
	type = number
	default = 1
}

variable "scan_display_name" {
	type = string
	default = "terraform-scan-config"
}

# it requires static ip allocated in your account only
variable "starting_urls" {
	type = list(string)
	default = ["http://35.238.139.150"]
}

variable "target_platforms" {
	type = list(string)
	default = ["COMPUTE"]
}

variable "export_to_security_command_center" {
	type = string
	default = "DISABLED"
}

// module "storage_transfer_service" variables

variable "storage_transfer_service-create" {
	type = bool
	default = false
}

variable "storage_transfer_service-count"{
	type = number
	default = 1
}

variable "schedule_start_date_year" {
	type = number
	default = 2018
}

variable "schedule_start_date_month" {
	type = number
	default = 10
}

variable "schedule_start_date_day" {
	type = number
	default = 1
}

variable "schedule_end_date_year" {
	type = number
	default = 2018
}

variable "schedule_end_date_month" {
	type = number
	default = 10
}

variable "schedule_end_date_day" {
	type = number
	default = 1
}

variable "delete_objects_unique_in_sink" { 
	type = bool
	default = false
}

variable "description_storage_transfer_job" {
	type = string
	default = "Nightly backup of S3 bucket"
}

variable "backup_bucket_role" {
	type = string
	default = "roles/storage.admin"
}


variable "storage_class" {
	type = string
	default = "NEARLINE"
}

variable "aws_s3_bucket" {
	type = string
	default = "yash-terraform-gcp"
}

# add you aws access key here
variable "aws_access_key" {
	type = string
	default = "YOUR_AWS_ACCESS_KEY_HERE"
}

# add your aws scret key here
variable "aws_secret_key" {
	type = string
	default = "YOUR_AWS_SECRET_KEY_HERE"
}

// module "cloud_build" variables

variable "cloudbuild_trigger-create" {
	type = bool
	default = false
}

variable "cloudbuild_trigger-count" {
	type = number
	default = 1
}

variable "cloudbuild_branch_name" {
	type = string
	default = "master"
}

variable "cloudbuild_repo_name" {
	type = string
	default = "spring-repo"
}

variable "cloudbuild_filename" {
	type = string
	default = "cloudbuild.yaml"
}

variable "cloudbuild_trigger_name" {
	type = string
  default = "spring-repo-trigger"
}

variable "cloudbuild_trigger_description" {
	type = string
  default = "trigger for spring-repo in cloud source repository"
}

// module "kubernetes_engine" variable

variable "kubernetes_engine-create" {
	type = bool
	default = false
}

variable "kubernetes_engine-count" {
	type = number
	default = 1
}

variable "k8s_cluster_name" {
	type = string
	default = "tf-gke-cluster"
}

variable "k8s_cluster_location" {
	type = string
	default = "us-central1-a"
}

variable "k8s_remove_default_node_pool" {
	type = bool
	default = true
}

variable "k8s_initial_node_count" {
	type = number
	default = 1
}

variable "k8s_username" {
	type = string
	default = "clusterusername"
}

variable "k8s_password" {
	type = string
	default = "clusterspassword"
}

variable "k8s_issue_client_certificate" {
	type = bool
	default = false
}

variable "k8s_pool_name" {
	type = string
	default = "tf-node-pool"
}

variable "k8s_pool_location" {
	type = string
	default = "us-central1-a"
}

variable "k8s_pool_node_count" {
	type = number
	default = 1
}

variable "k8s_pool_preemptible" {
	type = bool
	default = true
}

variable "k8s_pool_machine_type" {
	type = string
	default = "e2-micro"
}

variable "k8s_pool_disable-legacy-endpoints" {
	type = bool
	default = true
}

variable "k8s_pool_oauth_scopes" {
	type = list(string)
	default = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
}


// google_filestore_instance variables

variable "filestore-create" {
  type = bool
  default = false
}

variable "filestore-count" {
  type = number
  default = 1
}

variable "filestore_name" {
	type = string
  default = "yash-IAC"
}

variable "filestore_zone" {
	type = string
  default = "us-central1-b"
}

variable "filestore_tier" {
	type = string
  default = "STANDARD"

}

variable "capacity_gb" {
	type = number
  default = 1024
}

variable "fileshare_name" {
	type = string
  default = "IAC-Share"
}

variable "filestore_network" {
	type = string
  default = "default"
}

variable "filestore_network_mode" {
	type = list(string)
  default = ["MODE_IPV4"]
}

// google_firebase_project

variable "firebase-create" {
  type = bool
  default = false
}

variable "firebase-count" {
  type = number
  default = 1
}


variable "google_project_id" {
	type = string
  default = "playground-s-11-270a07c1"
}

variable "google_project_name" {
	type = string
  default = "test"

}

variable "google_org_id" {
	type = string
  default = "playground-s-11-270a07c1"
}

// google_ml_engine

variable "ml_engine-create" {
  type = bool
  default = false
}

variable "ml_engine-count" {
  type = number
  default = 1
}

variable "ml_engine_name" {
	type = string
  default = "yash-IAC"
}

variable "ml_engine_description" {
	type = string
  default = "IAC-Squad"
}

variable "online_prediction_console_logging" {
	type = bool
  default = false
}

variable "online_prediction_logging" {
	type = bool
  default = false
}

variable "ml_engine_regions" {
	type = list(string)
  default = ["us-central1-b"]
}

// google_os_config_patch_deployment

variable "os_config-create" {
  type = bool
  default = false
}

variable "os_config-count" {
  type = number
  default = 1
}
variable "patch_deployment_id" {
	type = string
  default = "patch-deploy-inst"
}
variable "os_config_security" {
	type = bool
  default = true
}

variable "os_config_minimal" {
	type = bool
  default = true
}

variable "os_config_instances" {
	type = list(string)
  description = "Targets any of the VM instances specified. Instances are specified by their URI in the form zones/{{zone}}/instances/{{instance_name}},"
  default = [ "value" ]
}

variable "time_zone_id" {
	type = string
  default = "America/New_York"
}

variable "hours" {
	type = number
  default = 0
}

variable "minutes" {
	type = number
  default = 30
}

variable "seconds" {
	type = number
  default = 20
}

variable "nanos" {
	type = number
  default = 10
}

variable "month_day" {
	type = number
  default = 1
}


// google_os_login

variable "os_login-create" {
	type = bool
  default = true
}

variable "os_login-count" {
	type = number
  default = 1
}

variable "os_login_user_email" {
	type = string
  default = "user@example.com"
}

variable "key_path" {
	type = string
  default = "file(path/to/id_rsa.pub)"
}

//runtime_configurator variables

variable "runtime_config-create" {
	type = bool
  default = true
}

variable "runtime_config-count" {
	type = number
  default = 1
}

variable "runtime_config_name" {
	type = string
  default = "yash-IAC"
}

variable "runtime_config_description" {
	type = string
  default = "Add description here"
}

variable "runtime_config_project" {
	type = string
  default = "project-id"
}

// google_service_directory_namespace

variable "namespace_id" {
	type = string
  default = "example-namespace"
}

variable "service_directory_location" {
	type = string
  default = "us-central1"
}

variable "labels" {
	type = map(string)
  default =  {
    key = "value"
    foo = "bar"
  }
}

// google_scc_source

variable "scc-create" {
	type = bool
  default = true
}

variable "scc-count" {
	type = number
  default = 1
} 

variable "scc_display_name" {
	type = string
  default = "IAC-Squad"
  description = "The source’s display name. "
}

variable "scc_organization" {
	type = string
  default = "123456789"
  description = "The organization whose Cloud Security Command Center the Source lives in."
}

variable "scc_description" {
	type = string
  default = "Enter your description"
}

// google_workflows_workflow

variable "workflow-create" {
	type = bool
  default = true
}

variable "workflow-count" {
	type = number
  default = 1
} 

variable "workflow_name" {
	type = string
  default = "IAC"
}

variable "workflow_region" {
	type = string
  default = "us-east-1"
}

variable "workflow_description" {
	type = string
  default = "Enter you description"
}


variable "service_account" {
	type = string
  default = "service account name"
}


# // Google Cloud Credential 

# variable "GOOGLE_CREDENTIALS" {
# 	type = string
# }

