# #!/bin/bash

# # AWS region and ECR repository name
# aws_region="us-east-1"  # Replace with your desired AWS region
# ecr_repository_name="thm"  # Replace with your ECR repository name
# s3_bucket_name="san-smartapps-bucket"

# # Function to list image tags in the ECR repository
# list_ecr_image_tags() {
#   aws ecr list-images --repository-name "$1" --region "$aws_region" --query 'imageIds[*].imageTag' --output text
# }

# # Function to trigger a CodeDeploy deployment
# trigger_codedeploy_deployment() {
#   aws deploy create-deployment --application-name "$1" --deployment-group-name "$2" --s3-location "bucket=$3,key=$4" --region "$aws_region" --deployment-config-name "CodeDeployDefault.OneAtATime"  # Change deployment configuration as needed
# }

# # Previous recorded tag (initialize with an empty string or the last known tag)
# previous_tag=""

# # Main loop
# while true; do
#   try
#     # List image tags in the ECR repository
#     image_tags=$(list_ecr_image_tags "$ecr_repository_name")

#     # Logic to determine if a new image tag is detected (e.g., by comparing with a previously recorded tag)
#     # You can implement your own logic here based on your requirements.

#     # Example: Compare with the previously recorded tag
#     if [ -n "$image_tags" ] && [ "$image_tags" != "$previous_tag" ]; then
#       echo "New image tag detected: $image_tags"
#       # Trigger a CodeDeploy deployment
#       trigger_codedeploy_deployment "MyCodeDeployApp" "MyDeploymentGroup" "your-s3-bucket" "your-codedeploy-revision.zip"
#     else
#       echo "No new image tags detected."
#     fi

#     # Store the latest image tag for comparison in the next iteration
#     previous_tag="$image_tags"

#     # Sleep for a specified interval (e.g., 5 minutes)
#     sleep 300

#   except
#     echo "Error: $?"
#   done
