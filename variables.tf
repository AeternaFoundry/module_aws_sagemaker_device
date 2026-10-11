variable "sagemaker_devices" {
  description = <<EOT
Map of sagemaker_devices, attributes below
Required:
    - device_fleet_name
    - device (block):
        - description (optional)
        - device_name (required)
        - iot_thing_name (optional)
Optional:
    - region
EOT

  type = map(object({
    device_fleet_name = string
    region            = optional(string)
    device = object({
      description    = optional(string)
      device_name    = string
      iot_thing_name = optional(string)
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_devices : (
        (length(v.device_fleet_name) >= 1 && length(v.device_fleet_name) <= 63) && (can(regex("^[0-9A-Za-z](-*[0-9A-Za-z]){0,62}$", v.device_fleet_name)))
      )
    ])
    error_message = "all of: must be between 1 and 63 characters; Valid characters are a-z, A-Z, 0-9, and - (hyphen)."
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_devices : (
        v.device.iot_thing_name == null || (length(v.device.iot_thing_name) >= 1 && length(v.device.iot_thing_name) <= 128)
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

