output "sagemaker_devices_id" {
  description = "Map of id values across all sagemaker_devices, keyed the same as var.sagemaker_devices"
  value       = { for k, v in aws_sagemaker_device.sagemaker_devices : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sagemaker_devices_agent_version" {
  description = "Map of agent_version values across all sagemaker_devices, keyed the same as var.sagemaker_devices"
  value       = { for k, v in aws_sagemaker_device.sagemaker_devices : k => v.agent_version if v.agent_version != null && length(v.agent_version) > 0 }
}
output "sagemaker_devices_arn" {
  description = "Map of arn values across all sagemaker_devices, keyed the same as var.sagemaker_devices"
  value       = { for k, v in aws_sagemaker_device.sagemaker_devices : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "sagemaker_devices_device" {
  description = "Map of device values across all sagemaker_devices, keyed the same as var.sagemaker_devices"
  value       = { for k, v in aws_sagemaker_device.sagemaker_devices : k => one(v.device) if v.device != null && length(v.device) > 0 }
}
output "sagemaker_devices_device_fleet_name" {
  description = "Map of device_fleet_name values across all sagemaker_devices, keyed the same as var.sagemaker_devices"
  value       = { for k, v in aws_sagemaker_device.sagemaker_devices : k => v.device_fleet_name if v.device_fleet_name != null && length(v.device_fleet_name) > 0 }
}
output "sagemaker_devices_region" {
  description = "Map of region values across all sagemaker_devices, keyed the same as var.sagemaker_devices"
  value       = { for k, v in aws_sagemaker_device.sagemaker_devices : k => v.region if v.region != null && length(v.region) > 0 }
}

