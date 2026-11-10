import 'dart:async';

mixin RequestLogger {
  void logAction(String message) {
    print('[LOG] $message');
  }
}

abstract class RequestAction {
  void describeAction();
}

class ServiceRequest {
  int requestId;
  String requesterName;
  String category;
  double estimatedCost;
  bool urgent;
  String _status;

  ServiceRequest(
    this.requestId,
    this.requesterName,
    this.category,
    this.estimatedCost,
    this.urgent,
    this._status,
  );

  String get status => _status;

  void updateStatus(String newStatus) {
    _status = newStatus;
  }

  void display() {
    print('Request-ID: $requestId');
    print('Requester Name: $requesterName');
    print('Category: $category');
    print('Estimated Cost: PHP $estimatedCost');
    print('Urgent: $urgent');
    print('Status: $_status');
  }

  Future<String> updateRequest() async {
    return await Future.delayed(
      Duration(seconds: 2),
      () => 'Request $requestId has been updated successfully.',
    );
  }
}

class RepairRequest extends RequestAction with RequestLogger {
  @override
  void describeAction() {
    print('Action: Repair campus equipment.');
    logAction('Repair request processed.');
  }
}

class ClearanceRequest extends RequestAction with RequestLogger {
  @override
  void describeAction() {
    print('Action: Process student clearance.');
    logAction('Clearance request processed.');
  }
}

String classifyRequest(bool urgent) {
  if (urgent) {
    return 'Urgent';
  } else {
    return 'Normal';
  }
}

Future<void> main() async {
  print('=== CAMPUS SERVICE REQUEST MANAGER ===\n');

  int requestId = 101;
  String requesterName = 'John';
  String category = 'Repair';
  double estimatedCost = 500.0;
  bool urgent = true;

  print('=== PART 1: REQUEST SUMMARY ===');

  print('Request-ID: $requestId');
  print('Requester Name: $requesterName');
  print('Category: $category');
  print('Estimated Cost: PHP $estimatedCost');
  print('Urgent: $urgent');
  print('Total with PHP 100 additional fee: PHP ${estimatedCost + 100}');
  print('Cost is greater than 300: ${estimatedCost > 300}');

  print('\nRequest-ID: 102');
  print('Requester Name: Maria');
  print('Category: Clearance');
  print('Estimated Cost: PHP 150.0');
  print('Urgent: false');

  print('\n=== PART 2: REQUEST CLASSIFICATION ===');

  List<Map<String, dynamic>> sampleRequests = [
    {'name': 'John', 'urgent': true},
    {'name': 'Maria', 'urgent': false},
    {'name': 'Peter', 'urgent': true},
  ];

  for (var request in sampleRequests) {
    print(
      '${request['name']}: ${classifyRequest(request['urgent'])}',
    );
  }

  try {
    int number = int.parse('ABC');
    print(number);
  } catch (e) {
    print('Error: Invalid number format.');
  }

  print('\n=== PART 3: OOP AND ENCAPSULATION ===');

  List<ServiceRequest> requests = [
    ServiceRequest(101, 'John', 'Repair', 500.0, true, 'Pending'),
    ServiceRequest(102, 'Maria', 'Clearance', 150.0, false, 'Approved'),
    ServiceRequest(103, 'Peter', 'Cleaning', 300.0, true, 'Pending'),
  ];

  Map<String, String> requestDetails = {
    'Repair': 'Equipment maintenance',
    'Clearance': 'Student document processing',
    'Cleaning': 'Campus cleaning service',
  };

  for (var request in requests) {
    request.display();
    print('Description: ${requestDetails[request.category]}');
    print('');
  }

  requests[0].updateStatus('In Progress');
  print('Updated Status: ${requests[0].status}');

  print('\n=== PART 4: INHERITANCE AND POLYMORPHISM ===');

  List<RequestAction> actions = [
    RepairRequest(),
    ClearanceRequest(),
  ];

  for (var action in actions) {
    action.describeAction();
  }


  print('\n=== PART 5: ASYNCHRONOUS PROGRAMMING ===');

  print('Updating request...');

  String result = await requests[0].updateRequest();

  print(result);

  Timer(Duration(seconds: 3), () {
    print('Timer: Scheduled service notification received.');
  });
}