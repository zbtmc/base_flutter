
// TODO: 未完成播放器封装
abstract class CommonPlayer{
    void setDataSource(String path);
    void onStart();
    void onPause();
    void onStop();
    void onCompleted();
    void release();
    void seekTo(int msec);
    void setVolume(double volume);
}