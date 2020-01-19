# Changelog file

#### 19 Jan 2020
Added this file to track activity without commit messaging

Plans are:

- Move `get, post, patch, put, delete` methods into a macroses that are not to be compiled if the appropriate setting is not set.
- Make the macroses ignore all incoming attributes if not compiling. This is for better perfomance and size of an exetutable.

Future plans are:

- Remove methods calls as functions and add functionality to lucky framework classes as monkey patches (to make it more clean).

