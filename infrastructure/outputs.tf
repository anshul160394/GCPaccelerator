// "cloud-storage" module outputs

output "bucket-url" {
  value = module.cloud-storage[*].url
}

// "pub/sub" module outputs

output "topic-id" {
  value = module.pubsub[*].id
}

output "topic-name" {
  value = module.pubsub[*].topic
}

// "memorystore" module outputs

output "memorystore-redis-ip" {
  value = module.memorystore[*].host
}

output "memorystore-redis-id" {
  value = module.memorystore[*].id
}

// "kms" module outputs

output "kms-keyring" {
  value = module.kms[*].keyring
}

output "kms-keys" {
  value = module.kms[*].keys
}

output "kms-keyring_name" {
  value = module.kms[*].keyring_name
}

//"network_vpc" module outputs

output "vpc" {
  value = module.network_vpc[*].network
}

output "vpc_name" {
  value = module.network_vpc[*].network_name
}

// "network_subnets" module outputs

output "subnets" {
  value = module.network_subnets[*].subnets
}

// "vm_instance_template" module outputs

output "selflink" {
  value = module.vm_instance_template[*].self_link
}

// "vm_compute_instance" module outputs

output "instances_self_links"{
value = module.vm_compute_instance[*].instances_self_links
}

// module "iam_member_iam" outputs

output "iam_member_iam_roles"{
value = module.iam_member_iam[*].roles
}

// module "iam_custom_role_iam" output

output "iam_custom_role_custom_role_id"{
value = module.iam_custom_role_iam[*].custom_role_id
}

// module "app_engine_standard_app_version" output

output "app_engine_standard_app_version_id"{
value = module.app_engine_standard_app_version[*].app_engine_id
}

output "app_engine_standard_app_version_name"{
value = module.app_engine_standard_app_version[*].app_engine_name
}

// module "cloud_sql" output

output "cloud_sql_self_link" {
value = module.cloud_sql[*].self_link  
}

output "cloud_sql_connection_name" {
value = module.cloud_sql[*].connection_name
}

output "cloud_sql_public_ip_address" {
value = module.cloud_sql[*].public_ip_address
}

// module "memcache" output

output "memcache_instance_id" {
value = module.memcache[*].memcache_instance_id
}

output "memcache_network_id" {
value = module.memcache[*].memcache_network_id
}

output "memcache_service_range_id" {
value = module.memcache[*].memcache_service_range_id
}

// module "container_registry" output

output "container_registry_bucket_id" {
value = module.container_registry[*].id
}

// module "cloud_scheduler" output

output "cloud_scheduler_id" {
value = module.cloud_scheduler[*].id 
}

//module "cloud_dns" output

output "record_id" {
value = module.cloud_dns[*].record_id  
}

output "dns_id" {
value = module.cloud_dns[*].dns_id  
}

//module "artifact_repository" output

output "artifact_id" {
  value = module.artifact_registry[*].id
}

output "artifact_name" {
  value = module.artifact_registry[*].name
}

// module "billing_budget" output

output "billing_budget_id" {
 value = module.billing_budget[*].id
}

output "billing_budget_name" {
 value = module.billing_budget[*].name
}

// module "cloud_function" outputs

output "cloud_function_id" {
   value = module.cloud_function[*].id
}

output "cloud_function_trigger_url" {
   value = module.cloud_function[*].trigger_url
}

// module "deployment_manager" outputs

output "deployment_manager_id" {
	value = module.deployment_manager[*].id
}

output "deployment_manager_deployment_id" {
	value = module.deployment_manager[*].deployment_id
}

// module "cloud_run" ouputs

output "cloud_run_id" {
	value = module.cloud_run[*].id
}

output "cloud_run_status" {
	value = module.cloud_run[*].status
}

// modules "source_repositories" outputs

output "source_repositories_id" {
	value = module.source_repositories[*].id
}

output "source_repositories_url" {
	value = module.source_repositories[*].url
}

// module "cloud_spanner" outputs

output "spanner_instance_id" {
	value = module.cloud_spanner[*].instance_id
}

output "spanner_instance_state" {
	value = module.cloud_spanner[*].instance_state
}

output "spanner_database_id" {
	value = module.cloud_spanner[*].database_id
}

output "spanner_database_state" {
	value = module.cloud_spanner[*].database_state
}

// module "secret_manager" outputs

output "secret_id" {
	value = module.secret_manager[*].secret_id
}

output "secret_version_id" {
	value = module.secret_manager[*].secret_version_id
}

// module "web_security_scanner" outputs

output "web_security_scanner_id" {
	value = module.web_security_scanner[*].scanner_id
}

// module "storage_transfer_service" outputs

output "storage_transfer_job_name" {
	value = module.storage_transfer_service[*].storage_transfer_job_name
}

// module "cloud_build" outputs

output "cloud_build_trigger_id" {
	value = module.cloud_build[*].id
}

// module "kubernetes_engine" outputs

output "cluster_id" {
	value = module.kubernetes_engine[*].cluster_id
}

output "cluster_endpoint" {
	value = module.kubernetes_engine[*].cluster_endpoint
}

output "pool_id" {
	value = module.kubernetes_engine[*].pool_id
}

output "pool_instance_group_urls" {
	value = module.kubernetes_engine[*].pool_instance_group_urls
}

// google_filestore_instance

output "filestore_id" {
	value = module.google_filestore_instance[*].filestore_id
}

// google_firebase_project
output "firebase_id" {
	value = module.google_firebase_project[*].firebase_id
}


// google_ml_engine_model
output "ml_engine_id" {
	value = module.google_ml_engine_model[*].ml_engine_id
}

// google_os_config_patch_deployment outputs
output "os_config_patch_id" {
  value = module.google_os_config_patch_deployment[*].os_config_patch_id
}

// google_os_login
output "os_login_id" {
  value = module.google_os_login_ssh_public_key[*].os_login_id
}


// runtime_configurator
output "google_runtimeconfig_id" {
  value = module.runtime_configurator[*].google_runtimeconfig_id
}

// google_scc_source

output "scc_id" {
	value= module.security_command_center[*].scc_id
}

// google_workflows_workflow

output "workflow_id" {
	value = module.google_workflows_workflow[*].workflow_id
}