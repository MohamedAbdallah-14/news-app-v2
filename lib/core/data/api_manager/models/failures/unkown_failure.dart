import 'package:news_app/core/data/api_manager/models/failures/failure_info.dart';
import 'package:news_app/core/data/api_manager/models/failures/reportable_failure.dart';

class UnknownFailure extends ReportableFailure {
  UnknownFailure(FailureInfo failureInfo)
      : super(failureInfo: failureInfo, type: 'Unknown Failure');
}
