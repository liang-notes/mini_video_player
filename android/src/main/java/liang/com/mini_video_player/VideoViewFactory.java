package liang.com.mini_video_player;

import android.content.Context;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class VideoViewFactory extends PlatformViewFactory {
    private final PluginRegistry.Registrar registrar;

    public VideoViewFactory(PluginRegistry.Registrar registrar) {
        super(StandardMessageCodec.INSTANCE);
        this.registrar = registrar;
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        return new VideoView(context, viewId, args, this.registrar);
    }
}