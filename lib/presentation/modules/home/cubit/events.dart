abstract class AppEvent{}
class GetChangeNavBottomEvents extends AppEvent{
  int idx;

  GetChangeNavBottomEvents({required this.idx});
}
class GetDataFromApiEvents extends AppEvent{}
