def lambda_handler(event, context):
    message='hello Abhi'.format(event['key1'])
    return{
        'message':message      
    }







