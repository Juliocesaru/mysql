locals{
  myjuliosql_app=[for f in fileset("${path.module}/config", "[^_]*.yaml") : yamldecode(file("${path.module}/config/${f}"))]
  myjuliosql_app_list = flatten([
    for app in local.myjuliosql_app : [
      for mysqlapps in try(app.listofmsqlapp, []) :{
        name = mysqlapps.name

      }
    ]
 ])
 }
