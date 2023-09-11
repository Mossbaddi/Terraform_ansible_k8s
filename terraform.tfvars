# La région AWS où vous souhaitez déployer les ressources (par exemple, "us-west-1")
region = "<AWS_REGION>"

# Le nom de la clé EC2 que vous souhaitez utiliser pour les instances
key_name = "<EC2_KEY_NAME>"

# Nom du cluster EKS (par exemple, "mon-cluster-eks")
cluster_name = "<EKS_CLUSTER_NAME>"

# Version de Kubernetes pour le cluster EKS (par exemple, "1.21")
cluster_version = "<EKS_CLUSTER_VERSION>"

# Type d'instance pour les nœuds de travail EKS (par exemple, "t2.micro")
instance_type = "<EKS_INSTANCE_TYPE>"

# Nombre souhaité de nœuds de travail (par exemple, 1)
desired_capacity = <DESIRED_CAPACITY>

# Nombre minimum de nœuds de travail (par exemple, 1)
min_capacity = <MIN_CAPACITY>

# Nombre maximum de nœuds de travail (par exemple, 1)
max_capacity = <MAX_CAPACITY>
