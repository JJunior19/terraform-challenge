import boto3
import json
import os
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO) if os.environ.get(
    'LOG_LEVEL') == 'INFO' else logger.setLevel(logging.DEBUG)

CUSTOMER_TABLE = os.environ.get('CUSTOMER_TABLE', 'customer-dev')
ENVIRONMENT = os.environ.get('ENVIRONMENT', 'local')
if ENVIRONMENT == 'local':
    dynamodb = boto3.client('dynamodb',  endpoint_url=f'http://{os.environ.get("LOCALSTACK_HOSTNAME", "localhost")}:4566',
                            aws_access_key_id='test', aws_secret_access_key='test')
    s3 = boto3.client('s3', endpoint_url=f'http://{os.environ.get("LOCALSTACK_HOSTNAME", "localhost")}:4566',
                      aws_access_key_id='test', aws_secret_access_key='test')

else:
    dynamodb = boto3.client('dynamodb')
    s3 = boto3.client('s3')


def lambda_handler(event, context):
    logger.info(
        f"ENVIRONMENT: {ENVIRONMENT} - CUSTOMER_TABLE: {CUSTOMER_TABLE}")
    logger.info(f"Received {len(event['Records'])} files to be processed")

    records_processed = 0

    for record in event['Records']:
        try:
            bucket = record['s3']['bucket']['name']
            key = record['s3']['object']['key']
            logger.info(f"Processing {key} from {bucket}")

            obj = s3.get_object(Bucket=bucket, Key=key)
            data = json.loads(obj['Body'].read().decode('utf-8'))
            logger.info(f"Data received: {data}")
            for customer in data:
                dynamodb.put_item(
                    TableName=CUSTOMER_TABLE,
                    Item={
                        'id': {'S': customer['id']},
                        'name': {'S': customer['name']},
                        'surname': {'S': customer['surname']},
                        'birthdate': {'S': customer['birthdate']},
                        'address': {'S': customer['address']},
                        'car': {'M': {
                            'make': {'S': customer['car']['make']},
                            'model': {'S': customer['car']['model']},
                            'year': {'N': str(customer['car']['year'])},
                            'color': {'S': customer['car']['color']},
                            'plate': {'S': customer['car']['plate']},
                            'mileage': {'N': str(customer['car']['mileage'])},
                            'fuelType': {'S': customer['car']['fuelType']},
                            'transmission': {'S': customer['car']['transmission']},
                        }},
                        'fee': {'N': str(customer['fee'])}
                    }
                )
                records_processed += 1
            logger.info(f"Processed {records_processed} records from {key}")
        except Exception as e:
            logger.error(f"Error processing file {key}: {e}")
            continue
        logger.info(f"Processed {records_processed} records")
    return 0
