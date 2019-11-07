package liang.com.mini_video_player;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;

import cn.jzvd.JzvdStd;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformView;

import static cn.jzvd.Jzvd.*;


public class VideoView implements PlatformView, MethodChannel.MethodCallHandler {
    private final JzvdStd jzvdStd;
    private final MethodChannel methodChannel;
    private final PluginRegistry.Registrar registrar;

    public VideoView(Context context, int viewId, Object args, PluginRegistry.Registrar registrar) {
        this.registrar = registrar;
        this.jzvdStd = getJzvdStd(registrar, args);
        this.methodChannel = new MethodChannel(registrar.messenger(), "mini_video_player_" + viewId);
        this.methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return jzvdStd;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "loadUrl":
                String url = methodCall.arguments.toString();
                jzvdStd.setUp(url, "", SCREEN_NORMAL);
                break;
            case "resume":
                jzvdStd.mediaInterface.start();
                break;
            case "pause":
                jzvdStd.mediaInterface.pause();
                break;
            case "dealloc":
                jzvdStd.mediaInterface.release();
                break;
            default:
                result.notImplemented();
        }
    }

    @Override
    public void dispose() {

    }

    private JzvdStd getJzvdStd(PluginRegistry.Registrar registrar, Object args) {
        JzvdStd view = (JzvdStd) LayoutInflater.from(registrar.activity()).inflate(R.layout.jz_video, null);
        return view;
    }

}
