provider "aws" {
  # La région AWS où vous souhaitez déployer les ressources
  region  = var.region
  
  # Version du fournisseur AWS pour garantir la compatibilité
  version = "~> 3.0"

  # (Optionnel) Si vous souhaitez spécifier les clés d'accès AWS directement dans ce fichier (non recommandé pour des raisons de sécurité)
  # access_key = "<YOUR_AWS_ACCESS_KEY>"
  # secret_key = "<YOUR_AWS_SECRET_KEY>"
}

# Configuration pour le fournisseur Kubernetes, nécessaire pour certaines opérations avec le cluster EKS
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = module.eks.cluster_oidc_issuer_url
  load_config_file       = false
  version                = "~> 2.0"
}
