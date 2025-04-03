#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Run the commands in sequence
python3 scripts/yaml_to_json.py
rendercv render ./aadith_warrier_cv/aadith_warrier_CV.yaml --pdf-path ./assets/pdf/
npx prettier . --write
# git add .
# git status

# # Function to commit and push changes
# commit_and_push() {
#     # Check for any staged changes
#     if git diff --cached --quiet; then
#         echo "No staged changes to commit."
#     else
#         # Ask the user for a commit message
#         read -p "Enter the commit message: " commit_message

#         # Commit the changes
#         git commit -m "$commit_message"
#         echo "Changes committed with message: $commit_message"

#         # Push the changes
#         git push
#         echo "Changes pushed to the remote repository."
#     fi
# }

# # Ask the user if they want to commit and push changes
# read -p "Do you want to commit and push the changes to Git? (y/n): " user_input

# # Check the user's input
# if [[ "$user_input" == "y" || "$user_input" == "Y" ]]; then
#     commit_and_push
# elif [[ "$user_input" == "n" || "$user_input" == "N" ]]; then
#     echo "Commit and push cancelled by the user."
# else
#     echo "Invalid input. Please enter 'y' or 'n'."
#     exit 1  # Exit with an error status for invalid input
# fi
