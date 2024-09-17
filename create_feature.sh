#!/bin/bash

# Check if feature name is provided
if [ -z "$1" ]; then
  echo "Error: No feature name provided."
  echo "Usage: ./create_feature.sh FeatureName"
  exit 1
fi

# Capitalize the first letter of the feature name for PascalCase class names
feature_name="$1"
feature_class_name=$(echo "$feature_name" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')

# Base directory path
base_dir="lib/features/$feature_name"

# Create directory structure
mkdir -p "$base_dir/data/datasources"
mkdir -p "$base_dir/data/models"
mkdir -p "$base_dir/data/repositories"
mkdir -p "$base_dir/domain/entities"
mkdir -p "$base_dir/domain/repositories"
mkdir -p "$base_dir/domain/usecase"
mkdir -p "$base_dir/presentation/bloc"
mkdir -p "$base_dir/presentation/page"

# Create basic files with basic structure

# DataSource
cat <<EOL > "$base_dir/data/datasources/${feature_name}_remote_data_source.dart"
class ${feature_class_name}RemoteDataSource {
  // TODO: Implement remote data source methods
}
EOL

# Model (Empty directory for models)

# Repository Implementation
cat <<EOL > "$base_dir/data/repositories/${feature_name}_repo_impl.dart"
import '../../domain/repositories/${feature_name}_repo.dart';

class ${feature_class_name}RepoImpl implements ${feature_class_name}Repo {
  // TODO: Implement repository methods
}
EOL

# Entity
cat <<EOL > "$base_dir/domain/entities/${feature_name}_entity.dart"
class ${feature_class_name}Entity {
  // TODO: Define the entity
}
EOL

# Repository Interface
cat <<EOL > "$base_dir/domain/repositories/${feature_name}_repo.dart"
abstract class ${feature_class_name}Repo {
  // TODO: Define repository interface methods
}
EOL

# Use Case
cat <<EOL > "$base_dir/domain/usecase/${feature_name}_usecase.dart"
import '../repositories/${feature_name}_repo.dart';

class ${feature_class_name}UseCase {
  final ${feature_class_name}Repo repository;

  ${feature_class_name}UseCase(this.repository);

  // TODO: Implement use case methods
}
EOL

# BLoC
cat <<EOL > "$base_dir/presentation/bloc/${feature_name}_bloc.dart"
import 'package:flutter_bloc/flutter_bloc.dart';
import '${feature_name}_event.dart';
import '${feature_name}_state.dart';

class ${feature_class_name}Bloc extends Bloc<${feature_class_name}Event, ${feature_class_name}State> {
  ${feature_class_name}Bloc() : super(${feature_class_name}Initial());

  @override
  Stream<${feature_class_name}State> mapEventToState(${feature_class_name}Event event) async* {
    // TODO: Add logic for event to state mapping
  }
}
EOL

# Event
cat <<EOL > "$base_dir/presentation/bloc/${feature_name}_event.dart"
import 'package:equatable/equatable.dart';

abstract class ${feature_class_name}Event extends Equatable {
  @override
  List<Object> get props => [];
}

class ${feature_class_name}Started extends ${feature_class_name}Event {}
EOL

# State
cat <<EOL > "$base_dir/presentation/bloc/${feature_name}_state.dart"
import 'package:equatable/equatable.dart';

abstract class ${feature_class_name}State extends Equatable {
  @override
  List<Object> get props => [];
}

class ${feature_class_name}Initial extends ${feature_class_name}State {}
EOL

# Page
cat <<EOL > "$base_dir/presentation/page/${feature_name}_page.dart"
import 'package:flutter/material.dart';

class ${feature_class_name}Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${feature_class_name} Page'),
      ),
      body: Center(
        child: Text('Welcome to ${feature_class_name} Page'),
      ),
    );
  }
}
EOL

# Echo the list of created files

echo -e "\nCreated files for feature '${feature_class_name}':\n"
echo -e "\033[0;32m$base_dir/data/datasources/${feature_name}_remote_data_source.dart\033[0m"
echo -e "\033[0;32m$base_dir/data/repositories/${feature_name}_repo_impl.dart\033[0m"
echo -e "\033[0;32m$base_dir/domain/entities/${feature_name}_entity.dart\033[0m"
echo -e "\033[0;32m$base_dir/domain/repositories/${feature_name}_repo.dart\033[0m"
echo -e "\033[0;32m$base_dir/domain/usecase/${feature_name}_usecase.dart\033[0m"
echo -e "\033[0;32m$base_dir/presentation/bloc/${feature_name}_bloc.dart\033[0m"
echo -e "\033[0;32m$base_dir/presentation/bloc/${feature_name}_event.dart\033[0m"
echo -e "\033[0;32m$base_dir/presentation/bloc/${feature_name}_state.dart\033[0m"
echo -e "\033[0;32m$base_dir/presentation/page/${feature_name}_page.dart\033[0m"

echo -e "\nFeature ${feature_class_name} has been created successfully under lib/features/$feature_name."