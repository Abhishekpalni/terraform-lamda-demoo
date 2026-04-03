def lambda_handler(event, context):
    message='hello jjjjjjj'.format(event['key1'])
    return{
        'message':message      
    }







