import os
import json
from moto import mock_aws
import boto3
import pytest
from src.index import lambda_handler
os.environ['databaseName'] = 'website_visitors'

@mock_aws
def test_first_visitor():
    # Setup
#    with mock_dynamodb():
    dynamodb = boto3.resource('dynamodb')
    
    # Create the DynamoDB table
    table = dynamodb.create_table(
        TableName='website_visitors',
        KeySchema=[
            {'AttributeName': 'id', 'KeyType': 'HASH'}
        ],
        AttributeDefinitions=[
            {'AttributeName': 'id', 'AttributeType': 'S'}
        ],
        BillingMode='PAY_PER_REQUEST'
    )

    # Set environment variable
    os.environ['databaseName'] = 'website_visitors'
    
    # Test
    response = lambda_handler({}, {})
    
    # Assert
    assert response['statusCode'] == 200
    assert response['headers']['Access-Control-Allow-Origin'] == '*'
    body = json.loads(response['body'])
    assert body['count'] == 1

@mock_aws
def test_increment_visitors():
    # Setup
#    with mock_dynamodb():
    dynamodb = boto3.resource('dynamodb')
    
    # Create the DynamoDB table
    table = dynamodb.create_table(
        TableName='website_visitors',
        KeySchema=[
            {'AttributeName': 'id', 'KeyType': 'HASH'}
        ],
        AttributeDefinitions=[
            {'AttributeName': 'id', 'AttributeType': 'S'}
        ],
        BillingMode='PAY_PER_REQUEST'
    )
    
    # Add initial visitor count
    table.put_item(
        Item={
            'id': 'visitor_count',
            'visitors': 5
        }
    )
    
    # Set environment variable
    os.environ['databaseName'] = 'website_visitors'
    
    # Test
    response = lambda_handler({}, {})
    
    # Assert
    assert response['statusCode'] == 200
    body = json.loads(response['body'])
    assert body['count'] == 6