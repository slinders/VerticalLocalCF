# DataWareHouseProject
## Overview
This is a Datawarehouse Project,
a [DataWareHouse](https://en.wikipedia.org/wiki/Data_warehouse) Project has three default modules.

- Persistence, an [HDB Module](https://www.youtube.com/watch?v=gNGn1dq4IMM) that contains the definition of the required [database model](https://en.wikipedia.org/wiki/Database_model)
  - [datastore object](https://help.sap.com/doc/DRAFT/5f67aa7f9a8b491cb08ea4bf9d381d90/2.0.0.0/en-US/SAP_HANA_DWF_Native_DataStore_Object.pdf)
  - [flowgraphs](https://help.sap.com/viewer/DRAFT/1e4f857a22aa477081d41d3b6fa48d99/2.0.0.0/en-US/bd68e24d1d744727891d4955640445f1.html)
  -  [calculation views](http://saphanatutorial.com/sap-hana-modeling/)
  - [persmissions](https://github.wdf.sap.corp/xs2/hdideploy.js) are defined in the defaults folder beneath the src folder.

- TaskChains, a DataWareHouseFoundation module, that contains the definition of the taskchains and their schedules. This is quite similar to the [BW Process Chains](https://help.sap.com/saphelp_nw70/helpdata/en/8f/c08b3baaa59649e10000000a11402f/content.htm).

- Backend, a [node module](https://nodejs.org/api/modules.html) providing [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) access to the data store objects defined in the Persistence Module.
  This module implements two taskgroups, namely ndso and flowgraph.
  + The ndso taskgroup has tasktypes to
    - activate Request: this allows to activate all requests of a given datastore
    - extractFromFile:  this allows to write the content of a csv file from the filesystem to a specified inbound table
    - extractFromWeb: this allows to retrieve a csv resource from the web and write it to a specified inbound table
    - extract via sql: this allows to write the resultset of a query to a specified inbound table

  + FlowGraph
    - execute: this allow to execute a flowgraph without parameters

All is done via a REST API, defined via [swagger](http://http://swagger.io/).
The api/swagger folder contains the yaml of the rest endpoints,
the api/controller folder contains the application logic. Use the registerTaskType.js file to register new taskgroups.
To register new tasktypes of a taskgroup you need to create a new route in the swagger.yaml file and implement the logic
in a controller in the controllers folder.

## Development model
The following [developing model](https://en.wikipedia.org/wiki/Software_development_process) is proposed:


### Setup of the environment
As a development environment SAP's webide should be used.
Every developer should have a user for the webide and an space exclusivly assigned to her.
In this space the di-builder should be deployed. (This can be done with the space-enablement ui of di-core).

### Initial Project
The developers can now create projects based on the datawarehouse project template. As a space
for this project they are supposed to use their exclusivly owned space. They should use "fixed service names"
which can be maintained in the project wizards template customization step.


### Editing the sources
- Taskchains: During editing of TaskChains the Backend Module must run.
  Only then the Task Types are properly registered and the value help is available.
- DB Artifact: DB artifacts are to be placed in the Persistence module.
  There the src folder is the location of choice.
  - The DataStoreObject is to be used for storing all topic and time based information.
  - Flowgraphs are to be used for extraction, transformation and loading
   To enjoy the value help, the developer need to rebuild the Persiscene module, whenever he has created
   new catalog artefacts.
  - Analytical Views are to be used to publish the Data to Olap Clients.
  - Analytical privileges are to be used to restrict access to the data.

### Sharing the source
The sources of the project should be checked in to a versioning management system.
WebIDE offers a good integration to
github. WebIDE offers to clone, pull, commit and push projects and project artifacts to [github](https://github.com/).

### Building and running the project
To test the project, developers can run the build on project level. The result is an mtar file which can be
 exported to the filesystem and then deployed to
the test system via the commandline tool "xs", say via xs deploy <mtarName>.

=======
# first_taskchain
