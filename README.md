# News App

Flutter project containing the code of the mobile app **_News App_**.

News App Flutter contains the menu app optimized for tables. Here you have your digital menu.

## Getting Started

Before you can run the project the following steps need to be followed:

### Get dependencies

Run `flutter pub get` in the project directory.

### Generate language files 

If the string files are not generated automatically (check Flutter Intl Plugins of your IDE) you can also run the command below to generate them manually.

```
dart run build_runner build
```

### Run app

There are several launch options for the different flavours (dev, staging and live) added to the launch.json for VSCode and runConfigurations for Android Studio.

## Flavours

The project contains three different flavours:

- **_dev_**: Development flavour
- **_production_**: Production flavour
- **_mock_**: Mock flavour

The flavours are defined in the `flavours` directory and the `main.dart` file in the `lib` directory.

## Mock Flavour

The mock flavour is used to run the app with mock data. The mock data is generated using faker package. The mock data is used to test the app without the need of the backend.

to run the app with the mock flavour, use the vscode launch configuration or the following command:

News App mock

```
flutter run --flavor mock -t lib/main_mock.dart
```

## Data Layer
The data layer is uses an API Manager to manage the API calls. The API Manager is a singleton (defiened by dependancy injection) that is used to make the API calls. The API Manager uses the Dio package to make the API calls. The API Manager is used by the Repository and The Repository is called in the Bloc.

### API Manager

The API Manager is a class that provides a simple interface for making API calls. It uses Dio for making the calls. It depends on a **_StatusChecker_** class to check the status of the response. and **_FailureHandler_** class to handle the failure of the API call. It can accept interceptors and adds them to the Dio instance.

#### Usage

To use the API Manager, you need to call send method with the following parameters:

      * request: Request object that contains the information of the API call.
      * responseFromMap: A function that converts the response body to the desired model.
      * errorResponseFromMap: A function that converts the error response body to the desired model. This is optional and if not provided, the default error response model will be used.

The send method returns a Future of Either<Failure, R> where R is the type of the response model. The Future will resolve to a Left<Failure> if the API call fails and to a Right<R> if the API call succeeds.

#### Example

    final response = await _apIsManager.send(
        request: LoginRequest(requestModel),
        responseFromMap: (map) => LoginResponseModel.fromMap(map),
        errorResponseFromMap: (map) => MessageResponseModel.fromMap(map), // optional
    );

The send should be called in the repository layer and the response should be handled in the logic layer.

#### Handling the response

    Future<void> _login(LoginRequestModel requestModel) async {
        emit(state.requestLoading());
        final result = await _repository.login(requestModel);
        emit(
        result.fold(
            (l) => state.requestFailed(l),
            (r) => state.requestSuccess(r),
        ),
        );
    }

#### Request

The Request class contains the information of the API call. it has already made mixins for the most common HTTP methods. You can use them or override all request parametes.

The base request class has the following parameters:

      * path: The path of the API call.
      * method: The HTTP method of the API call.
      * data: The data of the API call.
      * queryParameters: The query parameters of the API call.
      * requestModel: The request model of the API call.
      * includeAuthorization: A boolean that indicates if the authorization header should be added to the request or not. The default value is true.
      * multiPart: A boolean that indicates if the request is a multipart request or not. The default value is false.

GetRequest defaults the method to GET and data to null and **_RequestModel.toMap()_** to queryParameters.

PostRequest defaults the method to POST and queryParameters to null and **_RequestModel.toMap()_** to data.

PutRequest defaults the method to PUT and queryParameters to null and **_RequestModel.toMap()_** to data.

DeleteRequest defaults the method to DELETE and data to null and **_RequestModel.toMap()_** to queryParameters.

PatchRequest defaults the method to PATCH and queryParameters to null and **_RequestModel.toMap()_** to data.

##### Example

    class LoginRequest with Request, PostRequest {
        const LoginRequest(this.requestModel);

        @override
        final LoginRequestModel requestModel;

        @override
        String get path => '/api/users/login';
    }

#### RequestModel

The RequestModel is a class that contains the data of the API call. It has a method toMap that converts the model to a map.

#### Example

    class LoginRequestModel extends RequestModel {
        final PhoneNumber phoneNumber;
        final Password password;

        LoginRequestModel({
            required this.phoneNumber,
            required this.password,
            RequestProgressListener? progressListener,
        }) : super(progressListener);

        @override
       Future<Map<String, dynamic>> toMap() async {
        final map = <String, dynamic>{
            'phoneNumber': phoneNumber.value.fold(
                    (l) => throw ValidationException(l.valueKey),
                    (r) => r,
                ),
            'password': password.value.fold(
                    (l) => throw ValidationException(l.valueKey),
                    (r) => r,
                ),
            };

            return map;
        }

        @override
        List<Object> get props => [phoneNumber, password];
    }

#### Parameter (optional)

The Parameter class is a class that contain the user input that should be validated before sending the API call. It has a method validate that validates the parameter and stores a Failure if the validation fails.

##### Example

    class PhoneNumber extends Equatable {
        final Either<ValidationFailure, String> value;
        const PhoneNumber._(this.value);

        factory PhoneNumber(String value) =>  PhoneNumber._(_validatePhoneNumber(value));

        factory PhoneNumber.error(ValidationFailure failure) => PhoneNumber._(Left(failure));

        static Either<ValidationFailure, String> _validatePhoneNumber(String value) {
            final phoneValid = RegExp('[0-9]{10,12}').hasMatch(value);
            if (phoneValid) {
                return Right(value);
            }

            return Left(ValidationFailure('invalid_phone_number'));
        }

        @override
        List<Object> get props => [value];
    }

#### ResponseModel

The ResponseModel is a class that contains the response data of the API call. It has a method fromMap that converts the map to the model.

##### Example

    class LoginResponseModel extends Equatable implements ResponseModel {
        final User user;
        final String token;

        const LoginResponseModel({required this.user, required this.token});

        factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
            return LoginResponseModel(
            user: User.fromMap(map['user']),
            token: map['token'],
            );
        }

        Map<String, dynamic> toMap() => {
                'user': user.toMap(),
                'token': token,
            };

        @override
        List<Object> get props => [user, token];
    }
