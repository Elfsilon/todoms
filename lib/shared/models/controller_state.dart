import 'package:todoms/shared/interfaces/common.dart';

class ControllerStateNames {
  static const aimsState = "aims_state";
}

class ControllerState<T extends Serializable> {
  const ControllerState({
    required this.name,
    required this.value,
    this.loading = false,
    this.additionalLoading = false,
  });
  
  final String name;
  final bool loading;
  final bool additionalLoading;
  final T value;

  ControllerState<T> toggleLoader() {
    return ControllerState<T>(
      name: name,
      value: value, 
      loading: !loading
    );
  }
  
  ControllerState<T> toggleAdditionalLoader() {
    return ControllerState<T>(
      name: name,
      value: value, 
      additionalLoading: !additionalLoading
    );
  }

  ControllerState<T> changeValue(T newValue) {
    return ControllerState<T>(
      name: name,
      value: newValue,
      loading: loading,
      additionalLoading: additionalLoading,
    );
  } 
}
