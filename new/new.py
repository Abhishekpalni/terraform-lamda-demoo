def lambda_handler(event, context):
    message='hello Abhi999'.format(event['key1'])
    return{
        'message':message      
    }







