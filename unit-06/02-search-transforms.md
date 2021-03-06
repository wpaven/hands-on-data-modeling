# Search Transform

When configuring search through the REST API, we can specify pieces of the 
documents that should be included and we can choose among getting snippets, the 
full documents, or no content. Sometimes we just want to include some extra
information with each search result. In those cases, we can create a search 
transform. 

A search transform is a function that gets called for each search result. In
each call, the function can modify the resulting information that gets passed
back to the client. 

## Example: direct reports

As an example of a search transform, suppose we want to list how many direct
reports each employee search result has. Our search process would look like 
this:

1. perform the search
2. for each result
  1. count how many other employees have this employee as a manager
  2. add that amount to this search result

See direct-reports.xqy or directReports.sjs for an implementation of this.

## Deploying the Transform

We can deploy this transform using the deploy-transform.sh script again. This 
script uses the Management API to register the code with MarkLogic. The 
parameters we pass in are the file to be sent and the name of the transform, 
which will be used to call it. 

    $ ./deploy-transform.sh direct-reports.xqy direct-reports

## Calling the Transform

The workspace in Query Console has a buffer called "search transform". This 
makes a request to the REST API and specifies the transform that should be 
applied to the results. 