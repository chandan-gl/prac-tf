# everdriven-azure-keyvault

This project provisions an Azure Key Vault named "everdriven-dev" using Terraform.

## Prerequisites

- Terraform installed on your machine.
- An Azure account with the necessary permissions to create resources.

## Configuration Files

- **main.tf**: Contains the main configuration for provisioning the Azure Key Vault.
- **variables.tf**: Defines input variables for the configuration, such as location and access policies.
- **outputs.tf**: Specifies output values returned after the Key Vault is created.
- **provider.tf**: Configures the Azure provider with necessary credentials and subscription details.

## Instructions

1. **Clone the repository** or download the project files to your local machine.

2. **Navigate to the project directory**:
   ```
   cd everdriven-azure-keyvault
   ```

3. **Initialize Terraform**:
   ```
   terraform init
   ```

4. **Review the execution plan**:
   ```
   terraform plan
   ```

5. **Apply the configuration** to create the Azure Key Vault:
   ```
   terraform apply
   ```

6. **Confirm the creation** by typing `yes` when prompted.

## Outputs

After the Key Vault is created, you will receive output values such as the Key Vault ID and URI, which can be used for further configurations or integrations.

## Cleanup

To remove the resources created by this project, run:
```
terraform destroy
```
and confirm by typing `yes` when prompted.