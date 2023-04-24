class ReplicaModel {
  ReplicaModel({
    required this.version,
    required this.name,
    required this.url,
  });
  final String version;
  final String name;
  final String url;
}

final gfpan = ReplicaModel(
  name: 'gfpgan',
  version: '9283608cc6b7be6b65a8e44983db012355fde4132009bf99d976b2f0896856a3',
  url: 'https://api.replicate.com/v1/predictions',
);
