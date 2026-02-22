// create action group

resource "azurerm_monitor_action_group" "action_group" {
  name                = "ag-${var.proj}${var.env}-vm"
  resource_group_name = azurerm_resource_group.vm_rg.name
  short_name          = "maction"

  email_receiver {
    name          = "pwawslearning"
    email_address = var.email_address
  }
}

// monitoring VM's CPU
resource "azurerm_monitor_metric_alert" "cpu-metric" {
  name                = "vm-metricalert"
  resource_group_name = azurerm_resource_group.vm_rg.name
  scopes              = [azurerm_linux_virtual_machine.vm.id]
  description         = "Action will be triggered when average CPU is greater than 80."

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
    # when Average CPU > 80 for 5 min(default)
  }

  action {
    action_group_id = azurerm_monitor_action_group.action_group.id
  }
}

// Monitoring VM'S Disk

resource "azurerm_monitor_metric_alert" "disk" {
  name                = "vm-disk-metricalert"
  resource_group_name = azurerm_resource_group.vm_rg.name
  scopes              = [azurerm_linux_virtual_machine.vm.id]
  description         = "Action will be triggered when available disk space is less than 20."

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Available Memory Bytes"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 20
    # when Average disk space < 20 for 5 min(default)
  }

  action {
    action_group_id = azurerm_monitor_action_group.action_group.id
  }
}