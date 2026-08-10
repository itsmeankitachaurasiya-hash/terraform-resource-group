# 🌍 Azure Resource Group Terraform Module 🚀

[![Terraform](https://img.shields.io/badge/Terraform-%235847B7.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)


A clean, modular, and dynamic **Terraform** configuration designed to provision multiple **Azure Resource Groups** seamlessly using `for_each` mapping in Microsoft Azure.

---

## 📌 Table of Contents

- [✨ Features](#-features)
- [📁 Repository Structure](#-repository-structure)
- [⚙️ Prerequisites](#️-prerequisites)
- [🚀 Quick Start Guide](#-quick-start-guide)
- [💻 Code Overview](#-code-overview)
  - [`main.tf`](#maintf)
  - [`variable.tf`](#variabletf)
  - [`terraform.tfvars`](#terraformtfvars)
  - [`provider.tf`](#providertf)
- [📥 Input Variables](#-input-variables
- [🤝 Contributing](#-contributing)


---

## ✨ Features

- ⚡ **Dynamic Provisioning**: Employs Terraform `for_each` loops to deploy multiple Azure Resource Groups dynamically from a single map configuration.
- 🎯 **DRY Architecture**: Keeps code concise and scalable without duplicating resource declarations.
- 🔒 **AzureRM Provider v4.x**: Built and tested with modern HashiCorp `azurerm` provider configurations.
- 🛠️ **Easy Customization**: Easily add, edit, or remove resource groups by modifying simple key-value entries in `terraform.tfvars`.

---

## 📁 Repository Structure

```text
terraform-resource-group/
├── 📄 main.tf           # Core logic for azurerm_resource_group using for_each
├── 📄 provider.tf       # Terraform & AzureRM provider configuration
├── 📄 variable.tf       # Variable declarations
├── 📄 terraform.tfvars   # Environment-specific variable input values
├── 📄 .gitignore        # Git ignore rules for state files & secrets
└── 📄 README.md         # Project documentation
```

---

## ⚙️ Prerequisites

Before executing this Terraform module, make sure you have:

1. 🛠️ **[Terraform](https://www.terraform.io/downloads)** (v1.0.0 or later installed)
2. ☁️ **[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)** installed
3. 🔐 An active **Azure Subscription** with sufficient IAM role (e.g., Contributor/Owner) to manage Resource Groups.

---

## 🚀 Quick Start Guide

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/itsmeankitachaurasiya-hash/terraform-resource-group.git
cd terraform-resource-group
```

### 2️⃣ Azure Authentication

Sign in to your Azure account using Azure CLI:

```bash
az login
```

*(Optional)* Set your active Azure subscription ID:

```bash
az account set --subscription "YOUR_AZURE_SUBSCRIPTION_ID"
```

### 3️⃣ Initialize Terraform Working Directory

Download required AzureRM provider plugins:

```bash
terraform init
```

### 4️⃣ Generate Execution Plan

Verify the resources to be created:

```bash
terraform plan
```

### 5️⃣ Apply Infrastructure Changes

Deploy your Azure Resource Groups:

```bash
terraform apply -auto-approve
```

---

## 💻 Code Overview

### `main.tf`
```hcl
resource "azurerm_resource_group" "resource_block" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}
```

### `variable.tf`
```hcl
variable "rgs" {
  type        = map(object({
    name     = string
    location = string
  }))
  description = "Map of Azure Resource Groups to provision"
}
```

### `terraform.tfvars`
```hcl
rgs = {
  rg1 = {
    name     = "rg-india"
    location = "central india"
  }
  rg2 = {
    name     = "rg-bharat"
    location = "central india"
  }
}
```

### `provider.tf`
```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

---

## 📥 Input Variables

| Variable Name | Type | Description | Required |
| :--- | :--- | :--- | :---: |
| 🔹 `rgs` | `map(object)` | Map containing Resource Group names and target Azure locations | Yes 🟢 |

---




## 🤝 Contributing

Contributions, issues, and feature requests are always welcome! 

1. 🍴 Fork the project
2. 🌿 Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. 💾 Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. 🚀 Push to the branch (`git push origin feature/AmazingFeature`)
5. 📬 Open a Pull Request

---