class Task {
  String? _nameTask;
  bool? _status;
  String? _deadline;

  Task(this._nameTask, this._status, this._deadline);

  String? get deadline => _deadline;

  set deadline(String? value) {
    _deadline = value;
  }

  bool? get status => _status;

  set status( bool? value) {
    _status = value;
  }

  String? get nameTask => _nameTask;

  set nameTask(String? value) {
    _nameTask = value;
  }
}