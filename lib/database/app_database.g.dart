// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, email, password, role];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String email;
  final String password;
  final String role;
  const User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.role});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['role'] = Variable<String>(role);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
      role: Value(role),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<String>(role),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          String? email,
          String? password,
          String? role}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        role: role ?? this.role,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, password, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password &&
          other.role == this.role);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  final Value<String> role;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String password,
    required String role,
  })  : name = Value(name),
        email = Value(email),
        password = Value(password),
        role = Value(role);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? role,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? password,
      Value<String>? role}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String label;
  final String image;
  const Category({required this.id, required this.label, required this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['image'] = Variable<String>(image);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      label: Value(label),
      image: Value(image),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'image': serializer.toJson<String>(image),
    };
  }

  Category copyWith({int? id, String? label, String? image}) => Category(
        id: id ?? this.id,
        label: label ?? this.label,
        image: image ?? this.image,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.label == this.label &&
          other.image == this.image);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> label;
  final Value<String> image;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.image = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required String image,
  })  : label = Value(label),
        image = Value(image);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (image != null) 'image': image,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id, Value<String>? label, Value<String>? image}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $BooksModelTable extends BooksModel
    with TableInfo<$BooksModelTable, Books> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES categories(id)');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _coverPathMeta =
      const VerificationMeta('coverPath');
  @override
  late final GeneratedColumn<String> coverPath = GeneratedColumn<String>(
      'cover_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pdfPathMeta =
      const VerificationMeta('pdfPath');
  @override
  late final GeneratedColumn<String> pdfPath = GeneratedColumn<String>(
      'pdf_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _upload_byMeta =
      const VerificationMeta('upload_by');
  @override
  late final GeneratedColumn<String> upload_by = GeneratedColumn<String>(
      'upload_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        author,
        categoryId,
        description,
        coverPath,
        pdfPath,
        upload_by
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books_model';
  @override
  VerificationContext validateIntegrity(Insertable<Books> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cover_path')) {
      context.handle(_coverPathMeta,
          coverPath.isAcceptableOrUnknown(data['cover_path']!, _coverPathMeta));
    } else if (isInserting) {
      context.missing(_coverPathMeta);
    }
    if (data.containsKey('pdf_path')) {
      context.handle(_pdfPathMeta,
          pdfPath.isAcceptableOrUnknown(data['pdf_path']!, _pdfPathMeta));
    } else if (isInserting) {
      context.missing(_pdfPathMeta);
    }
    if (data.containsKey('upload_by')) {
      context.handle(_upload_byMeta,
          upload_by.isAcceptableOrUnknown(data['upload_by']!, _upload_byMeta));
    } else if (isInserting) {
      context.missing(_upload_byMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Books map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Books(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      coverPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_path'])!,
      pdfPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pdf_path'])!,
      upload_by: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}upload_by'])!,
    );
  }

  @override
  $BooksModelTable createAlias(String alias) {
    return $BooksModelTable(attachedDatabase, alias);
  }
}

class Books extends DataClass implements Insertable<Books> {
  final int id;
  final String title;
  final String author;
  final int categoryId;
  final String description;
  final String coverPath;
  final String pdfPath;
  final String upload_by;
  const Books(
      {required this.id,
      required this.title,
      required this.author,
      required this.categoryId,
      required this.description,
      required this.coverPath,
      required this.pdfPath,
      required this.upload_by});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['author'] = Variable<String>(author);
    map['category_id'] = Variable<int>(categoryId);
    map['description'] = Variable<String>(description);
    map['cover_path'] = Variable<String>(coverPath);
    map['pdf_path'] = Variable<String>(pdfPath);
    map['upload_by'] = Variable<String>(upload_by);
    return map;
  }

  BooksModelCompanion toCompanion(bool nullToAbsent) {
    return BooksModelCompanion(
      id: Value(id),
      title: Value(title),
      author: Value(author),
      categoryId: Value(categoryId),
      description: Value(description),
      coverPath: Value(coverPath),
      pdfPath: Value(pdfPath),
      upload_by: Value(upload_by),
    );
  }

  factory Books.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Books(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String>(json['author']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      description: serializer.fromJson<String>(json['description']),
      coverPath: serializer.fromJson<String>(json['coverPath']),
      pdfPath: serializer.fromJson<String>(json['pdfPath']),
      upload_by: serializer.fromJson<String>(json['upload_by']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String>(author),
      'categoryId': serializer.toJson<int>(categoryId),
      'description': serializer.toJson<String>(description),
      'coverPath': serializer.toJson<String>(coverPath),
      'pdfPath': serializer.toJson<String>(pdfPath),
      'upload_by': serializer.toJson<String>(upload_by),
    };
  }

  Books copyWith(
          {int? id,
          String? title,
          String? author,
          int? categoryId,
          String? description,
          String? coverPath,
          String? pdfPath,
          String? upload_by}) =>
      Books(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        categoryId: categoryId ?? this.categoryId,
        description: description ?? this.description,
        coverPath: coverPath ?? this.coverPath,
        pdfPath: pdfPath ?? this.pdfPath,
        upload_by: upload_by ?? this.upload_by,
      );
  Books copyWithCompanion(BooksModelCompanion data) {
    return Books(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      author: data.author.present ? data.author.value : this.author,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      description:
          data.description.present ? data.description.value : this.description,
      coverPath: data.coverPath.present ? data.coverPath.value : this.coverPath,
      pdfPath: data.pdfPath.present ? data.pdfPath.value : this.pdfPath,
      upload_by: data.upload_by.present ? data.upload_by.value : this.upload_by,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Books(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('coverPath: $coverPath, ')
          ..write('pdfPath: $pdfPath, ')
          ..write('upload_by: $upload_by')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, author, categoryId, description,
      coverPath, pdfPath, upload_by);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Books &&
          other.id == this.id &&
          other.title == this.title &&
          other.author == this.author &&
          other.categoryId == this.categoryId &&
          other.description == this.description &&
          other.coverPath == this.coverPath &&
          other.pdfPath == this.pdfPath &&
          other.upload_by == this.upload_by);
}

class BooksModelCompanion extends UpdateCompanion<Books> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> author;
  final Value<int> categoryId;
  final Value<String> description;
  final Value<String> coverPath;
  final Value<String> pdfPath;
  final Value<String> upload_by;
  const BooksModelCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.description = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.pdfPath = const Value.absent(),
    this.upload_by = const Value.absent(),
  });
  BooksModelCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String author,
    required int categoryId,
    required String description,
    required String coverPath,
    required String pdfPath,
    required String upload_by,
  })  : title = Value(title),
        author = Value(author),
        categoryId = Value(categoryId),
        description = Value(description),
        coverPath = Value(coverPath),
        pdfPath = Value(pdfPath),
        upload_by = Value(upload_by);
  static Insertable<Books> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? author,
    Expression<int>? categoryId,
    Expression<String>? description,
    Expression<String>? coverPath,
    Expression<String>? pdfPath,
    Expression<String>? upload_by,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (categoryId != null) 'category_id': categoryId,
      if (description != null) 'description': description,
      if (coverPath != null) 'cover_path': coverPath,
      if (pdfPath != null) 'pdf_path': pdfPath,
      if (upload_by != null) 'upload_by': upload_by,
    });
  }

  BooksModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? author,
      Value<int>? categoryId,
      Value<String>? description,
      Value<String>? coverPath,
      Value<String>? pdfPath,
      Value<String>? upload_by}) {
    return BooksModelCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      coverPath: coverPath ?? this.coverPath,
      pdfPath: pdfPath ?? this.pdfPath,
      upload_by: upload_by ?? this.upload_by,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (coverPath.present) {
      map['cover_path'] = Variable<String>(coverPath.value);
    }
    if (pdfPath.present) {
      map['pdf_path'] = Variable<String>(pdfPath.value);
    }
    if (upload_by.present) {
      map['upload_by'] = Variable<String>(upload_by.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksModelCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('coverPath: $coverPath, ')
          ..write('pdfPath: $pdfPath, ')
          ..write('upload_by: $upload_by')
          ..write(')'))
        .toString();
  }
}

class $FavoriteModelTable extends FavoriteModel
    with TableInfo<$FavoriteModelTable, favorites> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  @override
  late final GeneratedColumn<int> bookId = GeneratedColumn<int>(
      'book_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES books_model (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, bookId, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_model';
  @override
  VerificationContext validateIntegrity(Insertable<favorites> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book_id')) {
      context.handle(_bookIdMeta,
          bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta));
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  favorites map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return favorites(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      bookId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $FavoriteModelTable createAlias(String alias) {
    return $FavoriteModelTable(attachedDatabase, alias);
  }
}

class favorites extends DataClass implements Insertable<favorites> {
  final int id;
  final int bookId;
  final int userId;
  const favorites(
      {required this.id, required this.bookId, required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_id'] = Variable<int>(bookId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  FavoriteModelCompanion toCompanion(bool nullToAbsent) {
    return FavoriteModelCompanion(
      id: Value(id),
      bookId: Value(bookId),
      userId: Value(userId),
    );
  }

  factory favorites.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return favorites(
      id: serializer.fromJson<int>(json['id']),
      bookId: serializer.fromJson<int>(json['bookId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookId': serializer.toJson<int>(bookId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  favorites copyWith({int? id, int? bookId, int? userId}) => favorites(
        id: id ?? this.id,
        bookId: bookId ?? this.bookId,
        userId: userId ?? this.userId,
      );
  favorites copyWithCompanion(FavoriteModelCompanion data) {
    return favorites(
      id: data.id.present ? data.id.value : this.id,
      bookId: data.bookId.present ? data.bookId.value : this.bookId,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('favorites(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bookId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is favorites &&
          other.id == this.id &&
          other.bookId == this.bookId &&
          other.userId == this.userId);
}

class FavoriteModelCompanion extends UpdateCompanion<favorites> {
  final Value<int> id;
  final Value<int> bookId;
  final Value<int> userId;
  const FavoriteModelCompanion({
    this.id = const Value.absent(),
    this.bookId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  FavoriteModelCompanion.insert({
    this.id = const Value.absent(),
    required int bookId,
    required int userId,
  })  : bookId = Value(bookId),
        userId = Value(userId);
  static Insertable<favorites> custom({
    Expression<int>? id,
    Expression<int>? bookId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookId != null) 'book_id': bookId,
      if (userId != null) 'user_id': userId,
    });
  }

  FavoriteModelCompanion copyWith(
      {Value<int>? id, Value<int>? bookId, Value<int>? userId}) {
    return FavoriteModelCompanion(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<int>(bookId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteModelCompanion(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $BooksModelTable booksModel = $BooksModelTable(this);
  late final $FavoriteModelTable favoriteModel = $FavoriteModelTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final CategoriesDao categoriesDao = CategoriesDao(this as AppDatabase);
  late final BooksDao booksDao = BooksDao(this as AppDatabase);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, categories, booksModel, favoriteModel];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String name,
  required String email,
  required String password,
  required String role,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
  Value<String> password,
  Value<String> role,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FavoriteModelTable, List<favorites>>
      _favoriteModelRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.favoriteModel,
              aliasName:
                  $_aliasNameGenerator(db.users.id, db.favoriteModel.userId));

  $$FavoriteModelTableProcessedTableManager get favoriteModelRefs {
    final manager = $$FavoriteModelTableTableManager($_db, $_db.favoriteModel)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_favoriteModelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get role => $state.composableBuilder(
      column: $state.table.role,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter favoriteModelRefs(
      ComposableFilter Function($$FavoriteModelTableFilterComposer f) f) {
    final $$FavoriteModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.favoriteModel,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$FavoriteModelTableFilterComposer(ComposerState($state.db,
                $state.db.favoriteModel, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get role => $state.composableBuilder(
      column: $state.table.role,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool favoriteModelRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> role = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            email: email,
            password: password,
            role: role,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String email,
            required String password,
            required String role,
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            email: email,
            password: password,
            role: role,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({favoriteModelRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (favoriteModelRefs) db.favoriteModel
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (favoriteModelRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._favoriteModelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .favoriteModelRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool favoriteModelRefs})>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String label,
  required String image,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> label,
  Value<String> image,
});

class $$CategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get label => $state.composableBuilder(
      column: $state.table.label,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get label => $state.composableBuilder(
      column: $state.table.label,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<String> image = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            label: label,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String label,
            required String image,
          }) =>
              CategoriesCompanion.insert(
            id: id,
            label: label,
            image: image,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()>;
typedef $$BooksModelTableCreateCompanionBuilder = BooksModelCompanion Function({
  Value<int> id,
  required String title,
  required String author,
  required int categoryId,
  required String description,
  required String coverPath,
  required String pdfPath,
  required String upload_by,
});
typedef $$BooksModelTableUpdateCompanionBuilder = BooksModelCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> author,
  Value<int> categoryId,
  Value<String> description,
  Value<String> coverPath,
  Value<String> pdfPath,
  Value<String> upload_by,
});

final class $$BooksModelTableReferences
    extends BaseReferences<_$AppDatabase, $BooksModelTable, Books> {
  $$BooksModelTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FavoriteModelTable, List<favorites>>
      _favoriteModelRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.favoriteModel,
              aliasName: $_aliasNameGenerator(
                  db.booksModel.id, db.favoriteModel.bookId));

  $$FavoriteModelTableProcessedTableManager get favoriteModelRefs {
    final manager = $$FavoriteModelTableTableManager($_db, $_db.favoriteModel)
        .filter((f) => f.bookId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_favoriteModelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BooksModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BooksModelTable> {
  $$BooksModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get categoryId => $state.composableBuilder(
      column: $state.table.categoryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get coverPath => $state.composableBuilder(
      column: $state.table.coverPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get pdfPath => $state.composableBuilder(
      column: $state.table.pdfPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get upload_by => $state.composableBuilder(
      column: $state.table.upload_by,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter favoriteModelRefs(
      ComposableFilter Function($$FavoriteModelTableFilterComposer f) f) {
    final $$FavoriteModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.favoriteModel,
        getReferencedColumn: (t) => t.bookId,
        builder: (joinBuilder, parentComposers) =>
            $$FavoriteModelTableFilterComposer(ComposerState($state.db,
                $state.db.favoriteModel, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$BooksModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BooksModelTable> {
  $$BooksModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get categoryId => $state.composableBuilder(
      column: $state.table.categoryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get coverPath => $state.composableBuilder(
      column: $state.table.coverPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pdfPath => $state.composableBuilder(
      column: $state.table.pdfPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get upload_by => $state.composableBuilder(
      column: $state.table.upload_by,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$BooksModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BooksModelTable,
    Books,
    $$BooksModelTableFilterComposer,
    $$BooksModelTableOrderingComposer,
    $$BooksModelTableCreateCompanionBuilder,
    $$BooksModelTableUpdateCompanionBuilder,
    (Books, $$BooksModelTableReferences),
    Books,
    PrefetchHooks Function({bool favoriteModelRefs})> {
  $$BooksModelTableTableManager(_$AppDatabase db, $BooksModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BooksModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BooksModelTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> author = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> coverPath = const Value.absent(),
            Value<String> pdfPath = const Value.absent(),
            Value<String> upload_by = const Value.absent(),
          }) =>
              BooksModelCompanion(
            id: id,
            title: title,
            author: author,
            categoryId: categoryId,
            description: description,
            coverPath: coverPath,
            pdfPath: pdfPath,
            upload_by: upload_by,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String author,
            required int categoryId,
            required String description,
            required String coverPath,
            required String pdfPath,
            required String upload_by,
          }) =>
              BooksModelCompanion.insert(
            id: id,
            title: title,
            author: author,
            categoryId: categoryId,
            description: description,
            coverPath: coverPath,
            pdfPath: pdfPath,
            upload_by: upload_by,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BooksModelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({favoriteModelRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (favoriteModelRefs) db.favoriteModel
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (favoriteModelRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$BooksModelTableReferences
                            ._favoriteModelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BooksModelTableReferences(db, table, p0)
                                .favoriteModelRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.bookId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$BooksModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BooksModelTable,
    Books,
    $$BooksModelTableFilterComposer,
    $$BooksModelTableOrderingComposer,
    $$BooksModelTableCreateCompanionBuilder,
    $$BooksModelTableUpdateCompanionBuilder,
    (Books, $$BooksModelTableReferences),
    Books,
    PrefetchHooks Function({bool favoriteModelRefs})>;
typedef $$FavoriteModelTableCreateCompanionBuilder = FavoriteModelCompanion
    Function({
  Value<int> id,
  required int bookId,
  required int userId,
});
typedef $$FavoriteModelTableUpdateCompanionBuilder = FavoriteModelCompanion
    Function({
  Value<int> id,
  Value<int> bookId,
  Value<int> userId,
});

final class $$FavoriteModelTableReferences
    extends BaseReferences<_$AppDatabase, $FavoriteModelTable, favorites> {
  $$FavoriteModelTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BooksModelTable _bookIdTable(_$AppDatabase db) =>
      db.booksModel.createAlias(
          $_aliasNameGenerator(db.favoriteModel.bookId, db.booksModel.id));

  $$BooksModelTableProcessedTableManager? get bookId {
    if ($_item.bookId == null) return null;
    final manager = $$BooksModelTableTableManager($_db, $_db.booksModel)
        .filter((f) => f.id($_item.bookId!));
    final item = $_typedResult.readTableOrNull(_bookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.favoriteModel.userId, db.users.id));

  $$UsersTableProcessedTableManager? get userId {
    if ($_item.userId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId!));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FavoriteModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FavoriteModelTable> {
  $$FavoriteModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$BooksModelTableFilterComposer get bookId {
    final $$BooksModelTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bookId,
        referencedTable: $state.db.booksModel,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BooksModelTableFilterComposer(ComposerState($state.db,
                $state.db.booksModel, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FavoriteModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FavoriteModelTable> {
  $$FavoriteModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$BooksModelTableOrderingComposer get bookId {
    final $$BooksModelTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.bookId,
        referencedTable: $state.db.booksModel,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$BooksModelTableOrderingComposer(ComposerState($state.db,
                $state.db.booksModel, joinBuilder, parentComposers)));
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FavoriteModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteModelTable,
    favorites,
    $$FavoriteModelTableFilterComposer,
    $$FavoriteModelTableOrderingComposer,
    $$FavoriteModelTableCreateCompanionBuilder,
    $$FavoriteModelTableUpdateCompanionBuilder,
    (favorites, $$FavoriteModelTableReferences),
    favorites,
    PrefetchHooks Function({bool bookId, bool userId})> {
  $$FavoriteModelTableTableManager(_$AppDatabase db, $FavoriteModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavoriteModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FavoriteModelTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> bookId = const Value.absent(),
            Value<int> userId = const Value.absent(),
          }) =>
              FavoriteModelCompanion(
            id: id,
            bookId: bookId,
            userId: userId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int bookId,
            required int userId,
          }) =>
              FavoriteModelCompanion.insert(
            id: id,
            bookId: bookId,
            userId: userId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FavoriteModelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bookId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (bookId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.bookId,
                    referencedTable:
                        $$FavoriteModelTableReferences._bookIdTable(db),
                    referencedColumn:
                        $$FavoriteModelTableReferences._bookIdTable(db).id,
                  ) as T;
                }
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$FavoriteModelTableReferences._userIdTable(db),
                    referencedColumn:
                        $$FavoriteModelTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FavoriteModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoriteModelTable,
    favorites,
    $$FavoriteModelTableFilterComposer,
    $$FavoriteModelTableOrderingComposer,
    $$FavoriteModelTableCreateCompanionBuilder,
    $$FavoriteModelTableUpdateCompanionBuilder,
    (favorites, $$FavoriteModelTableReferences),
    favorites,
    PrefetchHooks Function({bool bookId, bool userId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$BooksModelTableTableManager get booksModel =>
      $$BooksModelTableTableManager(_db, _db.booksModel);
  $$FavoriteModelTableTableManager get favoriteModel =>
      $$FavoriteModelTableTableManager(_db, _db.favoriteModel);
}
