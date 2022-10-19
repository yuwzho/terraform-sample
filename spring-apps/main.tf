data "azurerm_spring_cloud_service" "service" {
  name                = "${var.service_name}"
  resource_group_name = "${var.resource_group_name}"
}

resource "azurerm_spring_cloud_app" "terraform_sample_1" {
  name                = "sample-app-1"
  resource_group_name = "${var.resource_group_name}"
  service_name        = "${var.service_name}"

  is_public           = true
  
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_spring_cloud_build_deployment" "sample_1_deployment" {
  name                = "deploy1"
  spring_cloud_app_id = azurerm_spring_cloud_app.terraform_sample_1.id
  build_result_id     = "<default>"
  instance_count      = 2
  environment_variables = {
    "Foo" : "Bar"
    "Env" : "Staging"
  }
  quota {
    cpu    = "2"
    memory = "4Gi"
  }
}

resource "azurerm_spring_cloud_active_deployment" "example" {
  spring_cloud_app_id = azurerm_spring_cloud_app.terraform_sample_1.id
  deployment_name     = azurerm_spring_cloud_build_deployment.sample_1_deployment.name
}

resource "azurerm_spring_cloud_app" "terraform_sample_2" {
  name                = "sample-app-2"
  resource_group_name = "${var.resource_group_name}"
  service_name        = "${var.service_name}"
}

resource "azurerm_spring_cloud_build_deployment" "sample_2_deployment" {
  name                = "deploy1"
  spring_cloud_app_id = azurerm_spring_cloud_app.terraform_sample_2.id
  build_result_id     = "<default>"
  instance_count      = 1
  environment_variables = {
    "Foo" : "Bar"
    "Env" : "Staging"
  }
  quota {
    cpu    = "1"
    memory = "1Gi"
  }
}
