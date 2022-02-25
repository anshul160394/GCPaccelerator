//module "cloud-storage"

module "cloud-storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "1.7.2"
  count = var.cloud-storage-create ? var.cloud-storage-count : 0
  # insert the 3 required variables here
  names      = var.names
  prefix     = var.prefix
  project_id = var.project_id
}

//module "pubsub"

module "pubsub" {
  source  = "terraform-google-modules/pubsub/google"
  version = "1.9.0"
  count = var.pub-sub-create ? var.pub-sub-count : 0
  # insert the 3 required variables here
  project_id = var.project_id
  topic = var.topic
}

//module "memorystore"

module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "1.3.1"
  count = var.memorystore-create ? var.memorystore-count : 0
  # insert the 11 required variables here
  display_name = var.redis_display_name
  location_id = var.redis_location_id
  name = var.redis_name
  project = var.project_id
  redis_version = var.redis_version
  region = var.redis_region
  memory_size_gb = var.memorystore_redis_size_GB
  tier = var.redis_tier
}

//module "kms"

module "kms" {
  source  = "terraform-google-modules/kms/google"
  version = "1.2.0"
  count = var.kms-create ? var.kms-count : 0
  # insert the 3 required variables here
  project_id = var.project_id
  keyring = var.kms_keyring
  location = var.kms_location
  keys = var.kms_keys
  prevent_destroy = var.kms_prevent_destroy
}

//module "network_vpc"

module "network_vpc" {
  source  = "siddharthmishra01/network/google//modules/vpc"
  version = "3.0.1"
  count = var.vpc-create ? var.vpc-count : 0
  # insert the 2 required variables here
  network_name = var.vpc_name
  project_id = var.project_id
}

//module "network_subnets"

module "network_subnets" {
  source  = "siddharthmishra01/network/google//modules/subnets"
  version = "3.0.1"
  count = var.subnets-create ? var.subnets-count : 0
  # insert the 3 required variables here
    depends_on = [module.network_vpc]
    project_id   = var.project_id
    network_name = module.network_vpc[0].network_name

    subnets = [
        {
            subnet_name           = var.subnet_1_name
            subnet_ip             = var.subnet_1_ip_range
            subnet_region         = var.subnet_1_region
            subnet_private_access = var.subnet_1_private_access
            subnet_flow_logs      = var.subnet_1_flow_logs
            description           = var.subnet_1_description
        },
        {
            subnet_name           = var.subnet_2_name
            subnet_ip             = var.subnet_2_ip_range
            subnet_region         = var.subnet_2_region
            subnet_private_access = var.subnet_2_private_access
            subnet_flow_logs      = var.subnet_2_flow_logs
            description           = var.subnet_2_description
        }
    ]
}

//module "network_fabric-net-firewall"

module "network_fabric-net-firewall" {
  source  = "siddharthmishra01/network/google//modules/fabric-net-firewall"
  version = "3.0.1"
  count = var.firewall-create ? var.firewall-count : 0
  # insert the 2 required variables here
  depends_on = [module.network_vpc]
  project_id              = var.project_id
  network                 = module.network_vpc[0].network_name
  internal_ranges_enabled = var.internal_ranges_enabled
  internal_ranges         = [var.internal_range]
  internal_target_tags    = [var.internal_target_tag]
  custom_rules = {
    ingress-rule = {
      description          = var.ingress-rule_description
      direction            = var.ingress-rule_direction
      action               = var.ingress-rule_action
      ranges               = [var.ingress-rule_range]
      targets              = [var.ingress-rule_target]
      sources              = []
      use_service_accounts = var.ingress-rule_use_service_accounts
      rules = [
        {
          protocol = var.ingress-rule_rules_protocol
          ports    = [var.ingress-rule_rules_port_8080, var.ingress-rule_rules_port_9090, var.ingress-rule_rules_port_8000]
        }
      ]
      extra_attributes = {}
    }
  }
  http_source_ranges = [var.http_source_range]
  http_target_tags = [var.http_target_tag]
  https_source_ranges = [var.https_source_range]
  https_target_tags = [var.https_target_tag]
  ssh_source_ranges = [var.ssh_source_range]
  ssh_target_tags =  [var.ssh_target_tag]
}

//module "vm_instance_template"

module "vm_instance_template" {
  source  = "siddharthmishra01/vm/google//modules/instance_template"
  version = "3.0.1"
  count   = var.vm_instance_template-create ? var.vm_instance_template-count : 0
  # insert the 3 required variables here
  project_id = var.project_id
  region     = var.vm_instance_template_region
  service_account = {
       email = var.service_account_email
      scopes =  [ var.service_account_scope_1 ]
  }
  disk_size_gb        = var.vm_instance_template_disk_size_gb
  machine_type        = var.vm_instance_template_machine_type
  source_image_family = var.vm_instance_template_source_image_family
  source_image_project = var.vm_instance_template_source_image_project
  network             = var.vm_instance_template_network
  name_prefix         = var.vm_instance_template_name_prefix
}

//module "vm_compute_instance"

module "vm_compute_instance" {
  source  = "siddharthmishra01/vm/google//modules/compute_instance"
  version = "3.0.1"
  count   = var.vm_compute_instance-create ? var.vm_compute_instance-count : 0
  # insert the 2 required variables here
  depends_on        = [module.vm_instance_template]
  region            = var.vm_compute_instance_region
  instance_template = module.vm_instance_template[0].self_link
  network           = var.vm_compute_instance_network
  hostname          = var.vm_compute_instance_hostname
  access_config = [
    {
    nat_ip          = ""
    network_tier    = var.vm_compute_instance_access_config_network_tier
    }
  ]
}

//module "iam_member_iam", a module to update service account with specific roles

module "iam_member_iam" {
  source  = "terraform-google-modules/iam/google//modules/member_iam"
  version = "7.0.0"
  count = var.iam_member_iam-create ? var.iam_member_iam-count : 0
  # insert the 3 required variables here
  service_account_address = var.iam_member_iam_service_account_address
  project_id              = var.project_id
  project_roles           = [var.iam_member_iam_project_role_1 , var.iam_member_iam_project_role_2 ]
}

//module "iam_custom_role_iam" , a module for creation of custom role and assign to a service/member account

module "iam_custom_role_iam" {
  source  = "terraform-google-modules/iam/google//modules/custom_role_iam"
  version = "7.0.0"
  count = var.iam_custom_role_iam-create ? var.iam_custom_role_iam-count : 0
  # insert the 4 required variables here
  target_level = var.iam_custom_role_iam_target_level
  target_id    = var.project_id
  role_id      = var.iam_custom_role_iam_target_id
  title        = var.iam_custom_role_title
  description  = var.iam_custom_role_description
  permissions  = [ var.iam_custom_role_permission_1 , var.iam_custom_role_permission_2 , var.iam_custom_role_permission_3 ]
  members      = [ var.iam_custom_role_member_1 ]
}

// module "app_engine_standard_app_version" 

module "app_engine_standard_app_version" {
  source = "./modules/app_engine"
  count  = var.app_engine_standard_app_version-create ? var.app_engine_standard_app_version-count : 0

  version_id           = var.version_id
  service              = var.service
  runtime              = var.runtime
  shell                = var.shell
  max_instances        = var.max_instances
  noop_on_destroy      = var.noop_on_destroy
  bucket_name          = var.bucket_name
  bucket_object_name   = var.bucket_object_name
  zip_path             = var.zip_path
}

// module "cloud_sql" , Once Cloud SQL deleted same name cannot be assumed for one week using terraform

module "cloud_sql" {
  source = "./modules/cloud_sql"
  count  = var.cloud_sql-create ? var.cloud_sql-count : 0
  db_instance_name        = var.db_instance_name
  sql_whitelist_ip_range  = var.sql_whitelist_ip_range
  database_version        = var.database_version
  sql_deletion_protection = var.sql_deletion_protection
  sql_region              = var.sql_region
  sql_tier                = var.sql_tier
  sql_disk_size           = var.sql_disk_size
  sql_username            = var.sql_username
  sql_password            = var.sql_password
  sql_host                = var.sql_host
}

// module "memcache"

module "memcache" {
  source = "./modules/memcache"
  count  = var.google_memcache_instance-create ? var.google_memcache_instance-count : 0
  memcache_network                        = var.memcache_network 
  memcache_global_address_name            = var.memcache_global_address_name
  memcache_global_address_purpose         = var.memcache_global_address_purpose
  memcache_global_address_type            = var.memcache_global_address_type
  memcache_global_prefix_length           = var.memcache_global_prefix_length
  google_memcache_instance_name           = var.google_memcache_instance_name
  google_memcache_instance_region         = var.google_memcache_instance_region
  google_memcache_instance_cpu_count      = var.google_memcache_instance_cpu_count
  google_memcache_instance_memory_size_mb = var.google_memcache_instance_memory_size_mb
  google_memcache_instance_node_count     = var.google_memcache_instance_node_count
}

// module "container_registry" creates storage bucket for container registry

module "container_registry" {
  source    = "./modules/container_registry"
  count     = var.container_registry-create ? var.container_registry-count : 0
  project   = var.project_id
  location  = var.registry_region
}

// module "cloud_scheduler"

module "cloud_scheduler" {
  source      = "./modules/cloud_scheduler"
  count       = var.scheduler_job-create ? var.scheduler_job-count : 0
  name        = var.scheduler_job_name
  description = var.scheduler_job_description
  time_zone   = var.scheduler_job_time_zone
  schedule    = var.scheduler_job_schedule
  topic_name  = var.scheduler_job_topic_name
  data        = var.scheduler_job_data
}

// module "cloud_dns"

module "cloud_dns" {
  source      = "./modules/cloud_dns"
  count       = var.cloud_dns-create ? var.cloud_dns-count : 0
  a_record    = var.a_record
  record_type = var.record_type
  ttl         = var.ttl
  rrdatas     = var.rrdatas
  dns         = var.dns
  dns_name    = var.dns_name
}

// module "artifact_repository" currently only supports only DOCKER in terraform not Maven or NPM

module "artifact_registry" {
  source        = "./modules/artifact_registry"
  count         = var.artifact_registry-create ? var.artifact_registry-count : 0
  location      = var.artifact_location
  repository_id = var.artifact_repository_id
  description   = var.artifact_registry_description
  format        = var.artifact_format
  project       = var.project_id 
}

// module "billing_budget" provide org level billing account administrator access to service account to execute this

module "billing_budget" {
 source = "./modules/billing_budget"
 count             = var.billing_budget-create ? var.billing_budget-count : 0
 billing_account   = var.billing_budget_billing_account
 display_name      = var.billing_budget_display_name
 currency_code     = var.billing_budget_currency_code
 units             = var.billing_budget_units  
 threshold_percent = var.billing_budget_threshold_percent
}

// module "cloud function"

module "cloud_function" {
 source = "./modules/cloud_function"
 count  = var.cloud_function-create ? var.cloud_function-count : 0
 archive_name			     = var.archive_name
 archive_bucket      	 = var.archive_bucket
 archive_path 			   = var.archive_path
 function_name			   = var.function_name
 function_description	 = var.function_description
 function_runtime		   = var.function_runtime
 function_memory_mb		 = var.function_memory_mb
 function_trigger_http = var.function_trigger_http
 function_entry_point	 = var.function_entry_point
 function_role			   = var.function_role
 function_member		   = var.function_member
}

// module "deployment_manager"

module "deployment_manager" {
	source          = "./modules/deployment_manager"
	count           = var.deployment_manager-create ? var.deployment_manager-count : 0
	deployment_name = var.deployment_name
	yaml_path		    = var.yaml_path
	import_name		  = var.import_name
	import_path		  = var.import_path
	label_key		    = var.label_key
	label_value		  = var.label_value
}

// module "cloud_run"

module "cloud_run" {
	source	= "./modules/cloud_run"
	count  	= var.cloud_run-create ? var.cloud_run-count : 0
	cloud_run_service_name 		= var.cloud_run_service_name
	cloud_run_location	   		= var.cloud_run_location
  cloud_run_image           = var.cloud_run_image
	cloud_run_traffic_percent	= var.cloud_run_traffic_percent
	cloud_run_latest_revision	= var.cloud_run_latest_revision
	cloud_run_role			    	= var.cloud_run_role
	cloud_run_member			    = var.cloud_run_member
}

// module "source_repositories"

module "source_repositories" {
	source 	= "./modules/source_repositories"
	count	= var.source_repositories-create ? var.source_repositories-count : 0
	repository_name   	= var.repository_name
	project_id		  	  = var.project_id
	repository_role		  = var.repository_role
	repository_members	= var.repository_members
}

// module "cloud_spanner"

module "cloud_spanner" {
	source 	= "./modules/cloud_spanner"
	count	= var.cloud_spanner-create ? var.cloud_spanner-count : 0
	spanner_region_config	= var.spanner_region_config
	spanner_instance_name	= var.spanner_instance_name
	spanner_num_nodes	  	= var.spanner_num_nodes
  spanner_deletion_protection = var.spanner_deletion_protection
	spanner_database_name	= var.spanner_database_name
	spanner_role			    = var.spanner_role
	spanner_members			  = var.spanner_members
}

// module "secret_manager"

module "secret_manager" {
	source = "./modules/secret_manager"
	count  = var.secret_manager-create ? var.secret_manager-count : 0
	secret_id 				      = var.secret_id
	secret_region 			    = var.secret_region
	secret_data				      = var.secret_data
	secret_manager_role		  = var.secret_manager_role
	secret_manager_members	= var.secret_manager_members
}

// module "web_security_scanner"

module "web_security_scanner" {
	source  = "./modules/web_security_scanner"
	count 	= var.web_security_scanner-create ? var.web_security_scanner-count : 0
	scan_display_name 	= var.scan_display_name
	starting_urls   		= var.starting_urls
  target_platforms  	= var.target_platforms
  export_to_security_command_center = var.export_to_security_command_center
}

// module "storage_transfer_service"

module "storage_transfer_service" {
	source = "./modules/storage_transfer_service"
	count = var.storage_transfer_service-create ? var.storage_transfer_service-count : 0
	project_id 			= var.project_id
	storage_class 		= var.storage_class
	backup_bucket_role 	= var.backup_bucket_role
	delete_objects_unique_in_sink  	= var.delete_objects_unique_in_sink
	description_storage_transfer_job = var.description_storage_transfer_job
	aws_s3_bucket 		= var.aws_s3_bucket
	aws_access_key 		= var.aws_access_key
	aws_secret_key 		= var.aws_secret_key
	schedule_start_date_year 	= var.schedule_start_date_year
	schedule_start_date_month	= var.schedule_start_date_month
	schedule_start_date_day = var.schedule_start_date_day
	schedule_end_date_year 	= var.schedule_end_date_year
	schedule_end_date_month	= var.schedule_end_date_month
	schedule_end_date_day 	= var.schedule_end_date_day
}

// module "cloud_build"

module "cloud_build" {
	source	= "./modules/cloud_build"
	count	= var.cloudbuild_trigger-create ? var.cloudbuild_trigger-count : 0
  cloudbuild_trigger_name = var.cloudbuild_trigger_name
  cloudbuild_trigger_description = var.cloudbuild_trigger_description
	cloudbuild_repo_name   = var.cloudbuild_repo_name
	cloudbuild_branch_name = var.cloudbuild_branch_name
	cloudbuild_filename    = var.cloudbuild_filename
}

// module "kubernetes_engine"

module "kubernetes_engine" {
	source = "./modules/kubernetes_engine"
	count = var.kubernetes_engine-create ? var.kubernetes_engine-count : 0
	k8s_cluster_name 		    = var.k8s_cluster_name
	k8s_cluster_location 	  = var.k8s_cluster_location
	k8s_remove_default_node_pool = var.k8s_remove_default_node_pool
	k8s_initial_node_count 	= var.k8s_initial_node_count
	k8s_username 			      = var.k8s_username
	k8s_password 			      = var.k8s_password
	k8s_issue_client_certificate = var.k8s_issue_client_certificate
	k8s_pool_name 			    = var.k8s_pool_name
	k8s_pool_location 		  = var.k8s_pool_location
	k8s_pool_node_count 	  = var.k8s_pool_node_count
	k8s_pool_preemptible 	  = var.k8s_pool_preemptible
	k8s_pool_machine_type 	= var.k8s_pool_machine_type
	k8s_pool_disable-legacy-endpoints = var.k8s_pool_disable-legacy-endpoints
	k8s_pool_oauth_scopes 	= var.k8s_pool_oauth_scopes
}


// Added by Mayur

// google_filestore_instance

module "google_filestore_instance" {
	source	= "./modules/filestore"
	count	= var.filestore-create ? var.filestore-count : 0
  filestore_name = var.filestore_name
  filestore_zone = var.filestore_zone
	capacity_gb = var.capacity_gb
	fileshare_name    = var.fileshare_name
  filestore_network_mode = var.filestore_network_mode
  filestore_network = var.filestore_network
  filestore_tier  = var.filestore_tier
}

// google_firebase_project

module "google_firebase_project" {
	source	= "./modules/firebase"
	count	= var.firebase-create ? var.firebase-count : 0
  google_project_id = var.google_project_id
  google_org_id = var.google_org_id
	google_project_name = var.google_project_name
}

// google_ml_engine

module "google_ml_engine_model" {
	source	= "./modules/ml_engine"
	count	= var.ml_engine-create ? var.ml_engine-count : 0
  ml_engine_name = var.ml_engine_name
  ml_engine_description = var.ml_engine_description
	ml_engine_regions = var.ml_engine_regions
  online_prediction_logging = var.online_prediction_logging
  online_prediction_console_logging = var.online_prediction_console_logging
}

// google_os_config_patch_deployment

module "google_os_config_patch_deployment" {
	source	= "./modules/os_config"
	count	= var.os_config-create ? var.os_config-count : 0
  patch_deployment_id = var.patch_deployment_id
  os_config_instances = var.os_config_instances
  os_config_minimal = var.os_config_minimal
  os_config_security = var.os_config_security
	time_zone_id = var.time_zone_id
  hours = var.hours
  minutes = var.minutes
  seconds = var.seconds
  nanos = var.nanos
  month_day = var.month_day

}


// google_os_login

module "google_os_login_ssh_public_key" {
	source	= "./modules/os_login"
	count	= var.os_login-create ? var.os_login-count : 0
  os_login_user_email = var.os_login_user_email
  key_path = var.key_path
}


// google_runtimeconfig_config

module "runtime_configurator" {
  source  = "./modules/runtime_configurator"
  count = var.runtime_config-create ? var.runtime_config-count : 0
  # insert the 3 required variables here
  runtime_config_name = var.runtime_config_name
  runtime_config_description = var.runtime_config_description
  runtime_config_project  = var.runtime_config_project 

}

// google_runtimeconfig_config

module "google_service_directory_namespace" {
  source  = "./modules/service_directory"
  count = var.runtime_config-create ? var.runtime_config-count : 0
  # insert the 3 required variables here
  namespace_id = var.runtime_config_name
  service_directory_location = var.runtime_config_description
  labels  = var.labels

}

// google_scc_source

module "security_command_center" {
  source  = "./modules/security_command_center"
  count = var.scc-create ? var.scc-count : 0
  # insert the 3 required variables here
  scc_display_name = var.scc_display_name
  scc_organization = var.scc_organization
  scc_description  = var.scc_description

}


// google_workflows_workflow

module "google_workflows_workflow" {
  source  = "./modules/workflows"
  count = var.workflow-create ? var.workflow-count : 0
  # insert the 3 required variables here
  workflow_name = var.workflow_name
  workflow_description = var.workflow_description
  workflow_region  = var.workflow_region
  service_account = var.service_account

}

