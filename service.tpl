[
    {
      "name": "${container_name}",
      "image": "${ecr_repo}",
      "cpu": 10,
      "memory": 512,
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ]
    }
]