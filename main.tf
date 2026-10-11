resource "aws_sagemaker_device" "sagemaker_devices" {
  for_each = var.sagemaker_devices

  device_fleet_name = each.value.device_fleet_name
  region            = each.value.region

  device {
    description    = each.value.device.description
    device_name    = each.value.device.device_name
    iot_thing_name = each.value.device.iot_thing_name
  }
}

