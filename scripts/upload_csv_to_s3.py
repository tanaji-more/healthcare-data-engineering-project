import boto3
import os

BUCKET_NAME = "healthcare-data-jan"
S3_FOLDER = "csv/"
LOCAL_FOLDER = "csv_data"

s3 = boto3.client('s3')

for file_name in os.listdir(LOCAL_FOLDER):
    if file_name.endswith(".csv"):
        local_path = os.path.join(LOCAL_FOLDER, file_name)
        s3_path = S3_FOLDER + file_name

        print(f"Uploading {local_path} to s3://{BUCKET_NAME}/{s3_path}")
        s3.upload_file(local_path, BUCKET_NAME, s3_path)

print("All CSV healthcare data uploaded to s3 successfully.")