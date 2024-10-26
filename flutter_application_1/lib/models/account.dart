// models/account.dart
class Account {
  final String instanceId;
  final String instanceName;
  final String accountSlug;

  Account({
    required this.instanceId,
    required this.instanceName,
    required this.accountSlug,
  });

  // Factory constructor to create an Account instance from JSON
  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      instanceId: json['instance_id'],
      instanceName: json['instance_name'],
      accountSlug: json['account_slug'],
    );
  }
}
