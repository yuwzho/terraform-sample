output "app1_id" {
    value       = azurerm_spring_cloud_app.terraform_sample_1.id
    description = "app1 resource id" 
}

output "app2_id" {
    value       = azurerm_spring_cloud_app.terraform_sample_2.id
    description = "app2 resource id" 
}
